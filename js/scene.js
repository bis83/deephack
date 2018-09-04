// Copyright (c) bis83. Distributed under the MIT License.

class Scene {
    constructor() {
    }

    onload(input, fx) {
        fx.sprite.load("img/title.png");
        fx.sprite.load("img/drillui.png");
    }

    update(input) {
    }

    draw(fx) {
        this.drawBackground(fx);
        this.drawHud(fx);
        this.drawTitle(fx);
    }

    drawBackground(fx) {
        fx.sprite.texture("img/drillui.png");
        fx.sprite.color(1, 1, 1, 1);
        fx.sprite.trans(320, 240, 640, 480, 0);
        fx.sprite.uv(0, 480/1024, 640/1024, 960/1024);
        fx.sprite.draw();
    }

    drawRocks(fx) {
    }

    drawDrillTank(fx) {
    }

    drawParticles(fx) {
    }

    drawHud(fx) {
        fx.sprite.texture("img/drillui.png");
        fx.sprite.color(1, 1, 1, 1);
        fx.sprite.trans(320, 240, 640, 480, 0);
        fx.sprite.uv(0, 0, 640/1024, 480/1024);
        fx.sprite.draw();
    }

    drawTitle(fx) {
        fx.sprite.texture("img/title.png");
        fx.sprite.color(1, 1, 1, 1);
        fx.sprite.trans(320, 240, 640, 480, 0);
        fx.sprite.uv(0, 0, 640/1024, 480/1024);
        fx.sprite.draw();
    }

    drawGameOver(fx) {
        fx.sprite.texture("img/title.png");
        fx.sprite.color(1, 1, 1, 1);
        fx.sprite.trans(320, 240, 640, 480, 0);
        fx.sprite.uv(0, 480/1024, 640/1024, 960/1024);
        fx.sprite.draw();
    }
}