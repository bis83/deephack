(() => {
  const Util = {};
  Util.createVertexShader = (gl, source) => {
    let shader = gl.createShader(gl.VERTEX_SHADER);
    gl.shaderSource(shader, source);
    gl.compileShader(shader);
    const success = gl.getShaderParameter(shader, gl.COMPILE_STATUS);
    if (success) {
      return shader;
    }
    console.log(source);
    console.log(gl.getShaderInfoLog(shader));
    gl.deleteShader(shader);
  };
  Util.createFragmentShader = (gl, source) => {
    let shader = gl.createShader(gl.FRAGMENT_SHADER);
    gl.shaderSource(shader, source);
    gl.compileShader(shader);
    const success = gl.getShaderParameter(shader, gl.COMPILE_STATUS);
    if (success) {
      return shader;
    }
    console.log(source);
    console.log(gl.getShaderInfoLog(shader));
    gl.deleteShader(shader);
  };
  Util.createProgram = (gl, vertex, fragment) => {
    let vs = Util.createVertexShader(gl, vertex);
    let fs = Util.createFragmentShader(gl, fragment);
    let program = gl.createProgram();
    gl.attachShader(program, vs);
    gl.attachShader(program, fs);
    gl.linkProgram(program);
    const success = gl.getProgramParameter(program, gl.LINK_STATUS);
    if (success) {
      return program;
    }
    console.log(gl.getProgramInfoLog(program));
    gl.deleteProgram(program);
  };
  Util.loadImageAsync = (path) => {
    return new Promise((resolve, reject) => {
      let image = new Image();
      image.onload = () => resolve(image);
      image.onerror = reject;
      image.src = path;
    });
  };
  Util.loadTextureAsync = async (gl, path) => {
    let result = await Util.loadImageAsync(path);
    let texture = gl.createTexture();
    gl.bindTexture(gl.TEXTURE_2D, texture);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
    gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, result);
    return texture;
  };
  Util.whiteTexture = (gl) => {
    let texture = gl.createTexture();
    gl.bindTexture(gl.TEXTURE_2D, texture);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_S, gl.CLAMP_TO_EDGE);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_WRAP_T, gl.CLAMP_TO_EDGE);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR);
    gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
    gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, 1, 1, 0, gl.RGBA, gl.UNSIGNED_BYTE, new Uint8Array(4).fill(255));
    return texture;
  };
  class Input {
    constructor() {
      this.keyMap = {
        "ArrowLeft": 0,
        "ArrowRight": 1,
        "ArrowUp": 2,
        "ArrowDown": 3,
        "Space": 4
      };
      this.keyState = new Array(5).fill(false);
      this.keyStateCount = new Array(5).fill(0);
      document.addEventListener("keydown", (e) => {
        const index = this.keyMap[e.code];
        if (index !== null) {
          this.keyState[index] = true;
          e.preventDefault();
        }
      });
      document.addEventListener("keyup", (e) => {
        const index = this.keyMap[e.code];
        if (index !== null) {
          this.keyState[index] = false;
          e.preventDefault();
        }
      });
      document.addEventListener("blur", (e) => {
        this.keyState.fill(false);
      });
    }
    update() {
      for (let i = 0; i < 5; ++i) {
        this.keyStateCount[i] = this.keyState[i] ? this.keyStateCount[i] + 1 : 0;
      }
    }
    left() {
      return this.keyStateCount[0] > 0;
    }
    right() {
      return this.keyStateCount[1] > 0;
    }
    up() {
      return this.keyStateCount[2] > 0;
    }
    down() {
      return this.keyStateCount[3] > 0;
    }
    decide() {
      return this.keyStateCount[4] == 1;
    }
  }
  class FxSprite {
    constructor(gl) {
      this.gl = gl;
      this.vs = `#version 300 es
        uniform mat4 world;
        uniform mat4 projection;
        uniform vec4 texcoord;
        out vec2 uv;
        void main() {
            float x = (gl_VertexID & 0x1) == 0 ? -0.5 : +0.5;
            float y = (gl_VertexID & 0x2) == 0 ? -0.5 : +0.5;
            gl_Position = projection * world * vec4(x, y, 0.0, 1.0);
            float u = (gl_VertexID & 0x1) == 0 ? texcoord.x : texcoord.z;
            float v = (gl_VertexID & 0x2) == 0 ? texcoord.w : texcoord.y;
            uv = vec2(u,v);
        }`;
      this.fs = `#version 300 es
        precision mediump float;
        uniform vec4 mainColor;
        uniform sampler2D textureColor;
        in vec2 uv;
        out vec4 finalColor;
        void main() {
            finalColor = mainColor * texture(textureColor, uv);
        }`;
      this.program = Util.createProgram(this.gl, this.vs, this.fs);
      this.world = this.gl.getUniformLocation(this.program, "world");
      this.worldValue = mat4.create();
      this.projection = this.gl.getUniformLocation(this.program, "projection");
      this.projectionValue = mat4.create();
      this.texcoord = this.gl.getUniformLocation(this.program, "texcoord");
      this.texcoordValue = vec4.fromValues(0, 0, 1, 1);
      this.mainColor = this.gl.getUniformLocation(this.program, "mainColor");
      this.mainColorValue = vec4.fromValues(1, 1, 1, 1);
      this.textureColor = this.gl.getUniformLocation(this.program, "textureColor");
      this.textureColorValue = "";
      this.blendMode = 0;
      this.textures = /* @__PURE__ */ new Map();
      this.textures["white"] = Util.whiteTexture(this.gl);
    }
    load(path) {
      if (this.textures[path] != null) {
        return;
      }
      this.textures[path] = "loading";
      Util.loadTextureAsync(this.gl, path).then((texture) => {
        this.textures[path] = texture;
      });
    }
    ortho(left, right, bottom, top) {
      mat4.ortho(this.projectionValue, left, right, bottom, top, -1, 1);
    }
    trans(x, y, sx, sy, rot) {
      const rotate = mat4.create();
      mat4.fromZRotation(rotate, rot);
      const scale = mat4.create();
      mat4.fromScaling(scale, vec3.fromValues(sx, sy, 1));
      const translate = mat4.create();
      mat4.fromTranslation(translate, vec3.fromValues(x, y, 1));
      mat4.mul(this.worldValue, rotate, scale);
      mat4.mul(this.worldValue, translate, this.worldValue);
    }
    color(r, g, b, a) {
      vec4.set(this.mainColorValue, r, g, b, a);
    }
    texture(path) {
      this.textureColorValue = path;
    }
    getTexture() {
      let texture = this.textures[this.textureColorValue];
      if (texture === "loading") {
        texture = null;
      }
      return texture ? texture : this.textures["white"];
    }
    uv(u0, v0, u1, v1) {
      vec4.set(this.texcoordValue, u0, v0, u1, v1);
    }
    blend(mode) {
      this.blendMode = mode;
    }
    draw() {
      this.gl.disable(this.gl.DEPTH_TEST);
      this.gl.enable(this.gl.BLEND);
      if (this.blendMode == 0) {
        this.gl.blendFunc(this.gl.SRC_ALPHA, this.gl.ONE_MINUS_SRC_ALPHA);
      } else {
        this.gl.blendFunc(this.gl.SRC_ALPHA, this.gl.ONE);
      }
      this.gl.useProgram(this.program);
      this.gl.uniformMatrix4fv(this.world, false, this.worldValue);
      this.gl.uniformMatrix4fv(this.projection, false, this.projectionValue);
      this.gl.uniform4fv(this.texcoord, this.texcoordValue);
      this.gl.activeTexture(this.gl.TEXTURE0);
      this.gl.bindTexture(this.gl.TEXTURE_2D, this.getTexture());
      this.gl.uniform1i(this.textureColor, 0);
      this.gl.uniform4fv(this.mainColor, this.mainColorValue);
      this.gl.drawArrays(this.gl.TRIANGLE_STRIP, 0, 4);
    }
  }
  class FxModel {
    constructor(gl) {
      this.gl = gl;
      this.vs = `#version 300 es
        in vec3 position;
        in vec2 texcoord;
        uniform mat4 world;
        uniform mat4 projection;
        uniform vec3 center;
        out vec2 uv;
        void main() {
            gl_Position = projection * world * vec4(position + center, 1.0);
            uv = vec2(texcoord.x, 1.0 - texcoord.y);
        }`;
      this.fs = `#version 300 es
        precision mediump float;
        uniform sampler2D textureColor;
        in vec2 uv;
        out vec4 finalColor;
        void main() {
            finalColor = texture(textureColor, uv);
        }`;
      this.program = Util.createProgram(this.gl, this.vs, this.fs);
      this.positionAttribute = this.gl.getAttribLocation(this.program, "position");
      this.texcoordAttribute = this.gl.getAttribLocation(this.program, "texcoord");
      this.center = this.gl.getUniformLocation(this.program, "center");
      this.world = this.gl.getUniformLocation(this.program, "world");
      this.worldValue = mat4.create();
      this.projection = this.gl.getUniformLocation(this.program, "projection");
      this.projectionValue = mat4.create();
      this.textureColor = this.gl.getUniformLocation(this.program, "textureColor");
      this.modelValue = "";
      this.models = /* @__PURE__ */ new Map();
      this.textures = /* @__PURE__ */ new Map();
      this.textures["white"] = Util.whiteTexture(this.gl);
    }
    load(path) {
      if (this.models[path] != null) {
        return;
      }
      this.models[path] = [];
      fetch(path).then((res) => res.json()).then((data) => {
        for (const mesh of data) {
          const vao = this.gl.createVertexArray();
          this.gl.bindVertexArray(vao);
          const buffer0 = this.gl.createBuffer();
          this.gl.bindBuffer(this.gl.ARRAY_BUFFER, buffer0);
          this.gl.bufferData(this.gl.ARRAY_BUFFER, new Float32Array(mesh.vertex), this.gl.STATIC_DRAW);
          this.gl.enableVertexAttribArray(this.positionAttribute);
          this.gl.vertexAttribPointer(this.positionAttribute, 3, this.gl.FLOAT, false, 20, 0);
          this.gl.enableVertexAttribArray(this.texcoordAttribute);
          this.gl.vertexAttribPointer(this.texcoordAttribute, 2, this.gl.FLOAT, false, 20, 12);
          const ibuffer = this.gl.createBuffer();
          this.gl.bindBuffer(this.gl.ELEMENT_ARRAY_BUFFER, ibuffer);
          this.gl.bufferData(this.gl.ELEMENT_ARRAY_BUFFER, new Uint16Array(mesh.index), this.gl.STATIC_DRAW);
          this.gl.bindVertexArray(null);
          this.loadTexture(mesh.texture);
          this.models[path].push({
            vao,
            buffer0,
            ibuffer,
            count: mesh.index.length,
            center: vec3.fromValues(mesh.center[0], mesh.center[1], mesh.center[2]),
            texture: mesh.texture
          });
        }
      });
    }
    loadTexture(path) {
      if (this.textures[path] != null) {
        return;
      }
      this.textures[path] = "loading";
      Util.loadTextureAsync(this.gl, path).then((texture) => {
        this.textures[path] = texture;
      });
    }
    getTexture(path) {
      let texture = this.textures[path];
      if (texture === "loading") {
        texture = null;
      }
      return texture ? texture : this.textures["white"];
    }
    model(path) {
      this.modelValue = path;
    }
    trans(s, x, y, rot) {
      const scale = mat4.create();
      mat4.fromScaling(scale, vec3.fromValues(s, s, s));
      const rotate = mat4.create();
      mat4.fromZRotation(rotate, rot);
      const translate = mat4.create();
      mat4.fromTranslation(translate, vec3.fromValues(x, y, 0));
      mat4.mul(this.worldValue, rotate, scale);
      mat4.mul(this.worldValue, translate, this.worldValue);
    }
    ortho(left, right, bottom, top) {
      mat4.ortho(this.projectionValue, left, right, bottom, top, -100, 100);
    }
    draw() {
      this.gl.enable(this.gl.DEPTH_TEST);
      this.gl.disable(this.gl.BLEND);
      this.gl.useProgram(this.program);
      this.gl.uniformMatrix4fv(this.world, false, this.worldValue);
      this.gl.uniformMatrix4fv(this.projection, false, this.projectionValue);
      const meshes = this.models[this.modelValue];
      for (const mesh of meshes) {
        this.gl.activeTexture(this.gl.TEXTURE0);
        this.gl.bindTexture(this.gl.TEXTURE_2D, this.getTexture(mesh.texture));
        this.gl.uniform1i(this.textureColor, 0);
        this.gl.uniform3fv(this.center, mesh.center);
        this.gl.bindVertexArray(mesh.vao);
        this.gl.drawElements(this.gl.TRIANGLES, mesh.count, this.gl.UNSIGNED_SHORT, 0);
        this.gl.bindVertexArray(null);
      }
    }
  }
  class Scene {
    constructor() {
      this.hiscore = 12261;
      this.wait = 0;
      this.reset();
    }
    reset() {
      this.score = 12261;
      this.life = 3 * 60 * 60;
      this.x = 5;
      this.y = 4;
      this.dir = 1;
      this.displayBias = 0;
      this.isGameOver = false;
      this.isGameStart = false;
      this.speed = 0.01;
      this.isSpeedUp = false;
      this.particleBooster = [];
      this.particleDestroy = [];
      this.fillRocks();
    }
    fillRocks() {
      this.rocks = [];
      for (let i = 0; i < 13; ++i) {
        let line = [];
        for (let j = 0; j < 9; ++j) {
          line.push({ type: 0, life: 50 });
        }
        this.rocks.push(line);
      }
      for (let i = 0; i < this.x + 1; ++i) {
        this.rocks[i][this.y].life = 0;
      }
    }
    onload(input, fx) {
      fx.sprite.load("img/title.png");
      fx.sprite.load("img/drillui.png");
      fx.model.load("json/drill.json");
      fx.model.load("json/rock_a.json");
      fx.model.load("json/rock_b.json");
    }
    update(input) {
      if (!this.isGameStart) {
        this.updateStart(input);
        return;
      }
      if (this.isGameOver) {
        this.updateGameOver(input);
        return;
      }
      this.updateMain(input);
    }
    updateStart(input) {
      if (input.decide()) {
        this.isGameStart = true;
      }
    }
    updateMain(input) {
      if (this.wait > 0) {
        this.wait -= 1;
        return;
      }
      this.dirDrill(input);
      if (input.decide()) {
        this.speedUpDrill();
      }
      this.attackDrill();
      this.speedDownDrill();
      this.consumeDrill();
      this.scrollRocks();
    }
    gameOver() {
      this.isGameOver = true;
      this.wait = 120;
      if (this.hiscore < this.score) {
        this.hiscore = this.score;
      }
    }
    dirDrill(input) {
      if (input.up()) {
        this.dir = 0;
        if (this.y <= 0) {
          this.dir = 1;
        }
      } else if (input.down()) {
        this.dir = 2;
        if (this.y >= 8) {
          this.dir = 1;
        }
      } else {
        this.dir = 1;
      }
    }
    speedUpDrill() {
      if (this.speed < 0.5) {
        this.isSpeedUp = true;
        this.speed += 0.01;
        this.emitParticleBooster(50, 40);
      }
    }
    attackDrill() {
      const damage = this.speed * 100 + (this.isSpeedUp ? 50 : 0);
      this.isSpeedUp = false;
      let x = this.x + (this.dir == 1 || !(this.y % 2 == 0) ? 1 : 0);
      let y = this.y + this.dir - 1;
      if (x >= 12) {
        return;
      }
      if (this.rocks[x][y].life > 0) {
        this.rocks[x][y].life -= damage;
        if (this.rocks[x][y].life <= 0) {
          this.emitPartcleDestroy(50, 50);
        } else {
          this.emitPartcleDestroy(4, 30);
        }
      }
      if (this.rocks[x][y].life <= 0) {
        this.x = x;
        this.y = y;
        if (this.y <= 0 || this.y >= 8) {
          this.dir = 1;
        }
      }
    }
    speedDownDrill() {
      if (this.life % 30 == 0 && this.speed > 0.01) {
        this.speed -= 0.01;
      }
    }
    consumeDrill() {
      this.life -= 1;
      if (this.life < 0) {
        this.gameOver();
      }
    }
    scrollRocks() {
      this.displayBias += this.speed;
      this.score += 100 * this.speed;
      if (this.displayBias >= 1) {
        this.nextRocks();
        this.displayBias = 0;
      }
    }
    nextRocks() {
      this.x -= 1;
      if (this.x < 0) {
        this.gameOver();
      }
      this.rocks.shift();
      let line = [];
      for (let j = 0; j < 9; ++j) {
        if (Math.random() < 0.1) {
          line.push({ type: 1, life: 1e3 });
        } else {
          line.push({ type: 0, life: 50 });
        }
      }
      this.rocks.push(line);
    }
    updateGameOver(input) {
      if (this.wait > 0) {
        this.wait -= 1;
        return;
      }
      if (input.decide()) {
        this.reset();
      }
    }
    emitParticleBooster(count, radius) {
      const d3 = 2 * Math.PI * (30 - this.dir * 30) / 360;
      for (let i = 0; i < count; ++i) {
        const d = 2 * Math.PI * Math.random();
        const d2 = radius * Math.random();
        const x = this.x * 60 - 60 * this.displayBias - (this.y % 2 == 0 ? 30 : 0);
        const y = 480 - this.y * 60 - (2 - Math.floor(Math.random() * 4));
        this.particleBooster.push({
          life: 5 + Math.floor(Math.random() * 35),
          x: x + d2 * Math.cos(d) - 50 * Math.cos(d3),
          y: y + 0.5 * d2 * Math.sin(d) - 50 * Math.sin(d3)
        });
      }
    }
    emitPartcleDestroy(count, radius) {
      const d3 = 2 * Math.PI * (30 - this.dir * 30) / 360;
      for (let i = 0; i < count; ++i) {
        const d = 2 * Math.PI * Math.random();
        const d2 = radius * Math.random();
        const x = this.x * 60 - 60 * this.displayBias - (this.y % 2 == 0 ? 30 : 0);
        const y = 480 - this.y * 60 - (2 - Math.floor(Math.random() * 4));
        this.particleDestroy.push({
          life: 4 + Math.floor(Math.random() * 10),
          x: x + 0.75 * d2 * Math.cos(d) + 40 * Math.cos(d3),
          y: y + d2 * Math.sin(d) + 40 * Math.sin(d3)
        });
      }
    }
    stepParticles() {
      for (let item of this.particleBooster) {
        item.life -= 1;
        item.x -= this.speed * 50;
      }
      for (let item of this.particleDestroy) {
        item.life -= 1;
        item.x -= this.speed * 50;
      }
      this.particleBooster = this.particleBooster.filter((item) => item.life > 0);
      this.particleDestroy = this.particleDestroy.filter((item) => item.life > 0);
    }
    draw(fx) {
      this.drawBackground(fx);
      this.drawRocks(fx);
      this.drawDrillTank(fx);
      this.stepParticles();
      this.drawParticles(fx);
      this.drawHud(fx);
    }
    drawBackground(fx) {
      fx.sprite.texture("img/drillui.png");
      fx.sprite.color(1, 1, 1, 1);
      fx.sprite.trans(320, 240, 640, 480, 0);
      fx.sprite.uv(0, 480 / 1024, 640 / 1024, 960 / 1024);
      fx.sprite.draw();
    }
    drawRocks(fx) {
      for (let i = 0; i < this.rocks.length; ++i) {
        for (let j = 0; j < this.rocks[i].length; ++j) {
          if (this.rocks[i][j].life <= 0) {
            continue;
          }
          if (this.rocks[i][j].type == 0) {
            fx.model.model("json/rock_a.json");
          } else {
            fx.model.model("json/rock_b.json");
          }
          const x = i * 60 - 60 * this.displayBias - (j % 2 == 0 ? 30 : 0);
          const y = 480 - j * 60;
          fx.model.trans(25, x, y, 0);
          fx.model.draw();
        }
      }
    }
    drawDrillTank(fx) {
      fx.model.model("json/drill.json");
      const x = this.x * 60 - 60 * this.displayBias - (this.y % 2 == 0 ? 30 : 0) - (2 - Math.floor(Math.random() * 4));
      const y = 480 - this.y * 60 - (2 - Math.floor(Math.random() * 4));
      const r = 2 * Math.PI * (40 - this.dir * 40) / 360;
      fx.model.trans(20, x, y, r);
      fx.model.draw();
    }
    drawParticles(fx) {
      fx.sprite.blend(1);
      fx.sprite.texture("img/drillui.png");
      fx.sprite.color(1, 1, 1, 1);
      fx.sprite.uv(640 / 1024, 72 / 1024, 648 / 1024, 80 / 1024);
      for (const item of this.particleBooster) {
        fx.sprite.trans(item.x, item.y, 8, 8, 0);
        fx.sprite.draw();
      }
      fx.sprite.uv(648 / 1024, 72 / 1024, 656 / 1024, 80 / 1024);
      for (const item of this.particleDestroy) {
        fx.sprite.trans(item.x, item.y, 8, 8, 0);
        fx.sprite.draw();
      }
      fx.sprite.blend(0);
    }
    drawHud(fx) {
      fx.sprite.texture("img/drillui.png");
      fx.sprite.uv(0, 0, 640 / 1024, 480 / 1024);
      fx.sprite.color(1, 1, 1, 1);
      fx.sprite.trans(320, 240, 640, 480, 0);
      fx.sprite.draw();
      this.drawLifeBar(fx);
      this.drawSpeedBar(fx);
      this.drawDepthBar(fx);
      if (!this.isGameStart) {
        this.drawTitle(fx);
      }
      if (this.isGameOver) {
        this.drawGameOver(fx);
      }
    }
    drawLifeBar(fx) {
      fx.sprite.texture("img/drillui.png");
      fx.sprite.uv(640 / 1024, 4 / 1024, 644 / 1024, 24 / 1024);
      fx.sprite.color(1, 1, 1, 1);
      const n = Math.floor(this.life / 180);
      for (let i = 0; i < n; ++i) {
        fx.sprite.trans(320 + 6 * i - 178, 240 - 228, 4, 20, 0);
        fx.sprite.draw();
      }
    }
    drawSpeedBar(fx) {
      fx.sprite.texture("img/drillui.png");
      fx.sprite.uv(640 / 1024, 0 / 1024, 704 / 1024, 4 / 1024);
      fx.sprite.color(1, 1, 1, 1);
      const n = Math.floor(this.speed * 100);
      for (let i = 0; i < n; ++i) {
        fx.sprite.trans(320 - 244, 240 + 6 * i - 214, 64, 4, 0);
        fx.sprite.draw();
      }
    }
    drawDepthBar(fx) {
      fx.sprite.texture("img/drillui.png");
      fx.sprite.uv(640 / 1024, 24 / 1024, 656 / 1024, 40 / 1024);
      fx.sprite.color(1, 1, 1, 1);
      fx.sprite.trans(320 + 312, 240 + 220 - 450 * (this.score / 26e5), 16, 16, 0);
      fx.sprite.draw();
      this.drawNumber(fx, 320 + 140, 240 + 208, this.score);
    }
    drawNumber(fx, x, y, val) {
      fx.sprite.texture("img/drillui.png");
      fx.sprite.color(1, 1, 1, 1);
      const digits = 7;
      for (let i = 0; i < digits; ++i) {
        const a = Math.floor(val / Math.pow(10, digits - i - 1)) % 10;
        const u = 640 + a * 20;
        fx.sprite.uv(u / 1024, 40 / 1024, (u + 20) / 1024, (40 + 32) / 1024);
        fx.sprite.trans(x + i * 20, y, 20, 32, 0);
        fx.sprite.draw();
      }
    }
    drawTitle(fx) {
      fx.sprite.texture("img/title.png");
      fx.sprite.uv(0, 0, 640 / 1024, 480 / 1024);
      fx.sprite.color(1, 1, 1, 1);
      fx.sprite.trans(320, 240, 640, 480, 0);
      fx.sprite.draw();
    }
    drawGameOver(fx) {
      fx.sprite.texture("img/title.png");
      fx.sprite.uv(0, 480 / 1024, 640 / 1024, 960 / 1024);
      fx.sprite.color(1, 1, 1, 1);
      fx.sprite.trans(320, 240, 640, 480, 0);
      fx.sprite.draw();
    }
  }
  class Application {
    constructor() {
      this.canvas = document.getElementById("main");
      document.body.appendChild(this.canvas);
      this.gl = this.canvas.getContext("webgl2");
      this.fx = {
        sprite: new FxSprite(this.gl),
        model: new FxModel(this.gl)
      };
      this.input = new Input();
      this.scene = new Scene();
      this.scene.onload(this.input, this.fx);
      const elem = document.getElementById("message");
      elem.style.display = `none`;
    }
    draw() {
      const width = window.innerWidth;
      if (width !== this.gl.canvas.width) {
        this.gl.canvas.width = width;
      }
      const height = window.innerHeight;
      if (height !== this.gl.canvas.height) {
        this.gl.canvas.height = height;
      }
      this.gl.viewport(0, 0, this.gl.canvas.width, this.gl.canvas.height);
      this.gl.clearColor(0, 0, 0, 0);
      this.gl.clearDepth(1);
      this.gl.clear(this.gl.COLOR_BUFFER_BIT | this.gl.DEPTH_BUFFER_BIT);
      const w = 640;
      const h = 480;
      this.gl.viewport((this.gl.canvas.width - w) / 2, (this.gl.canvas.height - h) / 2, w, h);
      this.fx.sprite.ortho(0, w, 0, h);
      this.fx.model.ortho(0, w, 0, h);
      this.scene.draw(this.fx);
    }
    loop() {
      requestAnimationFrame(() => this.loop());
      this.input.update();
      this.scene.update(this.input);
      this.draw();
    }
  }
  window.onload = () => {
    let app = new Application();
    app.loop();
  };
})();
