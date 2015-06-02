
;; Enum
((define-foreign-variable gl:true int "GL_TRUE")
(define-foreign-variable gl:false int "GL_FALSE")
(define-foreign-variable gl:array-buffer int "GL_ARRAY_BUFFER")
(define-foreign-variable gl:copy-read-buffer int "GL_COPY_READ_BUFFER")
(define-foreign-variable gl:copy-write-buffer int "GL_COPY_WRITE_BUFFER")
(define-foreign-variable gl:element-array-buffer int "GL_ELEMENT_ARRAY_BUFFER")
(define-foreign-variable gl:pixel-pack-buffer int "GL_PIXEL_PACK_BUFFER")
(define-foreign-variable gl:pixel-unpack-buffer int "GL_PIXEL_UNPACK_BUFFER")
(define-foreign-variable gl:texture-buffer int "GL_TEXTURE_BUFFER")
(define-foreign-variable gl:transform-feedback-buffer int "GL_TRANSFORM_FEEDBACK_BUFFER")
(define-foreign-variable gl:uniform-buffer int "GL_UNIFORM_BUFFER")
(define-foreign-variable gl:draw-framebuffer int "GL_DRAW_FRAMEBUFFER")
(define-foreign-variable gl:read-framebuffer int "GL_READ_FRAMEBUFFER")
(define-foreign-variable gl:framebuffer int "GL_FRAMEBUFFER")
(define-foreign-variable gl:renderbuffer int "GL_RENDERBUFFER")
(define-foreign-variable gl:texture-1d int "GL_TEXTURE_1D")
(define-foreign-variable gl:texture-2d int "GL_TEXTURE_2D")
(define-foreign-variable gl:texture-3d int "GL_TEXTURE_3D")
(define-foreign-variable gl:texture-1d-array int "GL_TEXTURE_1D_ARRAY")
(define-foreign-variable gl:texture-2d-array int "GL_TEXTURE_2D_ARRAY")
(define-foreign-variable gl:texture-rectangle int "GL_TEXTURE_RECTANGLE")
(define-foreign-variable gl:texture-cubemap int "GL_TEXTURE_CUBE_MAP")
(define-foreign-variable gl:texture-2d-multisample int "GL_TEXTURE_2D_MULTISAMPLE")
(define-foreign-variable gl:texture-2d-multisample-array int "GL_TEXTURE_2D_MULTISAMPLE_ARRAY")
(define-foreign-variable gl:func-add int "GL_FUNC_ADD")
(define-foreign-variable gl:func-subtract int "GL_FUNC_SUBTRACT")
(define-foreign-variable gl:func-reverse-subtract int "GL_FUNC_REVERSE_SUBTRACT")
(define-foreign-variable gl:min int "GL_MIN")
(define-foreign-variable gl:max int "GL_MAX")
(define-foreign-variable gl:one int "GL_ONE")
(define-foreign-variable gl:zero int "GL_ZERO")
(define-foreign-variable gl:src-color int "GL_SRC_COLOR")
(define-foreign-variable gl:one-minus-src-color int "GL_ONE_MINUS_SRC_COLOR")
(define-foreign-variable gl:dst-color int "GL_DST_COLOR")
(define-foreign-variable gl:one-minus-dst-color int "GL_ONE_MINUS_DST_COLOR")
(define-foreign-variable gl:src-alpha int "GL_SRC_ALPHA")
(define-foreign-variable gl:one-minus-src-alpha int "GL_ONE_MINUS_SRC_ALPHA")
(define-foreign-variable gl:dst-alpha int "GL_DST_ALPHA")
(define-foreign-variable gl:one-minus-dst-alpha int "GL_ONE_MINUS_DST_ALPHA")
(define-foreign-variable gl:constant-color int "GL_CONSTANT_COLOR")
(define-foreign-variable gl:one-minus-constant-color int "GL_ONE_MINUS_CONSTANT_COLOR")
(define-foreign-variable gl:constant-alpha int "GL_CONSTANT_ALPHA")
(define-foreign-variable gl:one-minus-constant-alpha int "GL_ONE_MINUS_CONSTANT_ALPHA")
(define-foreign-variable gl:stream-draw int "GL_STREAM_DRAW")
(define-foreign-variable gl:stream-read int "GL_STREAM_READ")
(define-foreign-variable gl:stream-copy int "GL_STREAM_COPY")
(define-foreign-variable gl:static-draw int "GL_STATIC_DRAW")
(define-foreign-variable gl:static-read int "GL_STATIC_READ")
(define-foreign-variable gl:static-copy int "GL_STATIC_COPY")
(define-foreign-variable gl:dynamic-draw int "GL_DYNAMIC_DRAW")
(define-foreign-variable gl:dynamic-read int "GL_DYNAMIC_READ")
(define-foreign-variable gl:dynamic-copy int "GL_DYNAMIC_COPY")
(define-foreign-variable gl:framebuffer-complete int "GL_FRAMEBUFFER_COMPLETE")
(define-foreign-variable gl:framebuffer-undefined int "GL_FRAMEBUFFER_UNDEFINED")
(define-foreign-variable gl:framebuffer-incomplete-attachment int "GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT")
(define-foreign-variable gl:framebuffer-incomplete-missing-attachment int "GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT")
(define-foreign-variable gl:framebuffer-incomplete-draw-buffer int "GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER")
(define-foreign-variable gl:framebuffer-incomplete-read-buffer int "GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER")
(define-foreign-variable gl:framebuffer-unsupported int "GL_FRAMEBUFFER_UNSUPPORTED")
(define-foreign-variable gl:framebuffer-incomplete-multisample int "GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE")
(define-foreign-variable gl:framebuffer-incomplete-layer-targets int "GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS")
(define-foreign-variable gl:clamp-read-color int "GL_CLAMP_READ_COLOR")
(define-foreign-variable gl:color-buffer-bit int "GL_COLOR_BUFFER_BIT")
(define-foreign-variable gl:depth-buffer-bit int "GL_DEPTH_BUFFER_BIT")
(define-foreign-variable gl:stencil-buffer-bit int "GL_STENCIL_BUFFER_BIT")
(define-foreign-variable gl:vertex-shader int "GL_VERTEX_SHADER")
(define-foreign-variable gl:geometry-shader int "GL_GEOMETRY_SHADER")
(define-foreign-variable gl:fragment-shader int "GL_FRAGMENT_SHADER")
(define-foreign-variable gl:none int "GL_NONE")
(define-foreign-variable gl:front-left int "GL_FRONT_LEFT")
(define-foreign-variable gl:front-right int "GL_FRONT_RIGHT")
(define-foreign-variable gl:back-left int "GL_BACK_LEFT")
(define-foreign-variable gl:back-right int "GL_BACK_RIGHT")
(define-foreign-variable gl:front int "GL_FRONT")
(define-foreign-variable gl:back int "GL_BACK")
(define-foreign-variable gl:front-and-back int "GL_FRONT_AND_BACK")
(define-foreign-variable gl:never int "GL_NEVER")
(define-foreign-variable gl:less int "GL_LESS")
(define-foreign-variable gl:equal int "GL_EQUAL")
(define-foreign-variable gl:less-equal int "GL_LEQUAL")
(define-foreign-variable gl:greater int "GL_GREATER")
(define-foreign-variable gl:not-equal int "GL_NOTEQUAL")
(define-foreign-variable gl:greater-equal int "GL_GEQUAL")
(define-foreign-variable gl:always int "GL_ALWAYS")
(define-foreign-variable gl:points int "GL_POINTS")
(define-foreign-variable gl:line-strip int "GL_LINE_STRIP")
(define-foreign-variable gl:line-loop int "GL_LINE_LOOP")
(define-foreign-variable gl:lines int "GL_LINES")
(define-foreign-variable gl:line-strip-adjacency int "GL_LINE_STRIP_ADJACENCY")
(define-foreign-variable gl:lines-adjacency int "GL_LINES_ADJACENCY")
(define-foreign-variable gl:triangle-strip int "GL_TRIANGLE_STRIP")
(define-foreign-variable gl:triangle-fan int "GL_TRIANGLE_FAN")
(define-foreign-variable gl:triangles int "GL_TRIANGLES")
(define-foreign-variable gl:triangle-strip-adjacency int "GL_TRIANGLE_STRIP_ADJACENCY")
(define-foreign-variable gl:triangles-adjacency int "GL_TRIANGLES_ADJACENCY")
(define-foreign-variable gl:unsigned-byte int "GL_UNSIGNED_BYTE")
(define-foreign-variable gl:unsigned-short int "GL_UNSIGNED_SHORT")
(define-foreign-variable gl:unsigned-int int "GL_UNSIGNED_INT")
(define-foreign-variable gl:float int "GL_FLOAT")
(define-foreign-variable gl:int int "GL_INT")
(define-foreign-variable gl:byte int "GL_BYTE")
(define-foreign-variable gl:short int "GL_SHORT")
(define-foreign-variable gl:half-float int "GL_HALF_FLOAT")
(define-foreign-variable gl:unsigned-byte-3-3-2 int "GL_UNSIGNED_BYTE_3_3_2")
(define-foreign-variable gl:unsigned-byte-2-3-3-rev int "GL_UNSIGNED_BYTE_2_3_3_REV")
(define-foreign-variable gl:unsigned-short-5-6-5 int "GL_UNSIGNED_SHORT_5_6_5")
(define-foreign-variable gl:unsigned-short-5-6-5-rev int "GL_UNSIGNED_SHORT_5_6_5_REV")
(define-foreign-variable gl:unsigned-short-4-4-4-4 int "GL_UNSIGNED_SHORT_4_4_4_4")
(define-foreign-variable gl:unsigned-short-4-4-4-4-rev int "GL_UNSIGNED_SHORT_4_4_4_4_REV")
(define-foreign-variable gl:unsigned-short-5-5-5-1 int "GL_UNSIGNED_SHORT_5_5_5_1")
(define-foreign-variable gl:unsigned-short-1-5-5-5-rev int "GL_UNSIGNED_SHORT_1_5_5_5_REV")
(define-foreign-variable gl:unsigned-int-8-8-8-8 int "GL_UNSIGNED_INT_8_8_8_8")
(define-foreign-variable gl:unsigned-int-8-8-8-8-rev int "GL_UNSIGNED_INT_8_8_8_8_REV")
(define-foreign-variable gl:unsigned-int-10-10-10-2 int "GL_UNSIGNED_INT_10_10_10_2")
(define-foreign-variable gl:unsigned-int-2-10-10-10-rev int "GL_UNSIGNED_INT_2_10_10_10_REV")
(define-foreign-variable gl:unsigned-int-24-8 int "GL_UNSIGNED_INT_24_8")
(define-foreign-variable gl:unsigned-int-10f-11f-11f-rev int "GL_UNSIGNED_INT_10F_11F_11F_REV")
(define-foreign-variable gl:unsigned-int-5-9-9-9-rev int "GL_UNSIGNED_INT_5_9_9_9_REV")
(define-foreign-variable gl:float-32-unsigned-int-24-8-rev int "GL_FLOAT_32_UNSIGNED_INT_24_8_REV")
(define-foreign-variable gl:signed-normalized int "GL_SIGNED_NORMALIZED")
(define-foreign-variable gl:unsigned-normalized int "GL_UNSIGNED_NORMALIZED")
(define-foreign-variable gl:blend int "GL_BLEND")
(define-foreign-variable gl:clip-distance0 int "GL_CLIP_DISTANCE0")
(define-foreign-variable gl:clip-distance1 int "GL_CLIP_DISTANCE1")
(define-foreign-variable gl:clip-distance2 int "GL_CLIP_DISTANCE2")
(define-foreign-variable gl:clip-distance3 int "GL_CLIP_DISTANCE3")
(define-foreign-variable gl:clip-distance4 int "GL_CLIP_DISTANCE4")
(define-foreign-variable gl:clip-distance5 int "GL_CLIP_DISTANCE5")
(define-foreign-variable gl:color-logic-op int "GL_COLOR_LOGIC_OP")
(define-foreign-variable gl:cull-gace int "GL_CULL_FACE")
(define-foreign-variable gl:depth-clamp int "GL_DEPTH_CLAMP")
(define-foreign-variable gl:depth-test int "GL_DEPTH_TEST")
(define-foreign-variable gl:dither int "GL_DITHER")
(define-foreign-variable gl:framebuffer-srgb int "GL_FRAMEBUFFER_SRGB")
(define-foreign-variable gl:line-smooth int "GL_LINE_SMOOTH")
(define-foreign-variable gl:multisample int "GL_MULTISAMPLE")
(define-foreign-variable gl:polygon-offset-fill int "GL_POLYGON_OFFSET_FILL")
(define-foreign-variable gl:polygon-offset-line int "GL_POLYGON_OFFSET_LINE")
(define-foreign-variable gl:polygon-offset-point int "GL_POLYGON_OFFSET_POINT")
(define-foreign-variable gl:polygon-smooth int "GL_POLYGON_SMOOTH")
(define-foreign-variable gl:primitive-restart int "GL_PRIMITIVE_RESTART")
(define-foreign-variable gl:sample-alpha-to-coverage int "GL_SAMPLE_ALPHA_TO_COVERAGE")
(define-foreign-variable gl:sample-alpha-to-one int "GL_SAMPLE_ALPHA_TO_ONE")
(define-foreign-variable gl:sample-coverage int "GL_SAMPLE_COVERAGE")
(define-foreign-variable gl:scissor-test int "GL_SCISSOR_TEST")
(define-foreign-variable gl:stencil-test int "GL_STENCIL_TEST")
(define-foreign-variable gl:texture-cubemap-seamless int "GL_TEXTURE_CUBE_MAP_SEAMLESS")
(define-foreign-variable gl:program-point-size int "GL_PROGRAM_POINT_SIZE")
(define-foreign-variable gl:color-attachment0 int "GL_COLOR_ATTACHMENT0")
(define-foreign-variable gl:color-attachment1 int "GL_COLOR_ATTACHMENT1")
(define-foreign-variable gl:color-attachment2 int "GL_COLOR_ATTACHMENT2")
(define-foreign-variable gl:color-attachment3 int "GL_COLOR_ATTACHMENT3")
(define-foreign-variable gl:color-attachment4 int "GL_COLOR_ATTACHMENT4")
(define-foreign-variable gl:color-attachment5 int "GL_COLOR_ATTACHMENT5")
(define-foreign-variable gl:color-attachment6 int "GL_COLOR_ATTACHMENT6")
(define-foreign-variable gl:color-attachment7 int "GL_COLOR_ATTACHMENT7")
(define-foreign-variable gl:color-attachment8 int "GL_COLOR_ATTACHMENT8")
(define-foreign-variable gl:color-attachment9 int "GL_COLOR_ATTACHMENT9")
(define-foreign-variable gl:color-attachment10 int "GL_COLOR_ATTACHMENT10")
(define-foreign-variable gl:color-attachment11 int "GL_COLOR_ATTACHMENT11")
(define-foreign-variable gl:color-attachment12 int "GL_COLOR_ATTACHMENT12")
(define-foreign-variable gl:color-attachment13 int "GL_COLOR_ATTACHMENT13")
(define-foreign-variable gl:color-attachment14 int "GL_COLOR_ATTACHMENT14")
(define-foreign-variable gl:color-attachment15 int "GL_COLOR_ATTACHMENT15")
(define-foreign-variable gl:depth-attachment int "GL_DEPTH_ATTACHMENT")
(define-foreign-variable gl:stencil-attachment int "GL_STENCIL_ATTACHMENT")
(define-foreign-variable gl:depth-stencil-attachment int "GL_DEPTH_STENCIL_ATTACHMENT")
(define-foreign-variable gl:cw int "GL_CW")
(define-foreign-variable gl:ccw int "GL_CCW")
(define-foreign-variable gl:active-texture int "GL_ACTIVE_TEXTURE")
(define-foreign-variable gl:aliased-line-width-range int "GL_ALIASED_LINE_WIDTH_RANGE")
(define-foreign-variable gl:smooth-line-width-range int "GL_SMOOTH_LINE_WIDTH_RANGE")
(define-foreign-variable gl:smooth-line-width-granularity int "GL_SMOOTH_LINE_WIDTH_GRANULARITY")
(define-foreign-variable gl:array-buffer-binding int "GL_ARRAY_BUFFER_BINDING")
(define-foreign-variable gl:blend-color int "GL_BLEND_COLOR")
(define-foreign-variable gl:blend-dst-alpha int "GL_BLEND_DST_ALPHA")
(define-foreign-variable gl:blend-dst-rgb int "GL_BLEND_DST_RGB")
(define-foreign-variable gl:blend-equation-rgb int "GL_BLEND_EQUATION_RGB")
(define-foreign-variable gl:blend-equation-alpha int "GL_BLEND_EQUATION_ALPHA")
(define-foreign-variable gl:blend-src-alpha int "GL_BLEND_SRC_ALPHA")
(define-foreign-variable gl:blend-src-rgb int "GL_BLEND_SRC_RGB")
(define-foreign-variable gl:color-clear-value int "GL_COLOR_CLEAR_VALUE")
(define-foreign-variable gl:color-logic-op int "GL_COLOR_LOGIC_OP")
(define-foreign-variable gl:color-writemask int "GL_COLOR_WRITEMASK")
(define-foreign-variable gl:compressed-texture-formats int "GL_COMPRESSED_TEXTURE_FORMATS")
(define-foreign-variable gl:cull-face int "GL_CULL_FACE")
(define-foreign-variable gl:current-program int "GL_CURRENT_PROGRAM")
(define-foreign-variable gl:depth-clear-value int "GL_DEPTH_CLEAR_VALUE")
(define-foreign-variable gl:depth-func int "GL_DEPTH_FUNC")
(define-foreign-variable gl:depth-range int "GL_DEPTH_RANGE")
(define-foreign-variable gl:depth-test int "GL_DEPTH_TEST")
(define-foreign-variable gl:depth-writemask int "GL_DEPTH_WRITEMASK")
(define-foreign-variable gl:dither int "GL_DITHER")
(define-foreign-variable gl:doublebuffer int "GL_DOUBLEBUFFER")
(define-foreign-variable gl:draw-buffer int "GL_DRAW_BUFFER")
(define-foreign-variable gl:draw-buffer0 int "GL_DRAW_BUFFER0")
(define-foreign-variable gl:draw-buffer1 int "GL_DRAW_BUFFER1")
(define-foreign-variable gl:draw-buffer2 int "GL_DRAW_BUFFER2")
(define-foreign-variable gl:draw-buffer3 int "GL_DRAW_BUFFER3")
(define-foreign-variable gl:draw-buffer4 int "GL_DRAW_BUFFER4")
(define-foreign-variable gl:draw-buffer5 int "GL_DRAW_BUFFER5")
(define-foreign-variable gl:draw-buffer6 int "GL_DRAW_BUFFER6")
(define-foreign-variable gl:draw-buffer7 int "GL_DRAW_BUFFER7")
(define-foreign-variable gl:draw-buffer8 int "GL_DRAW_BUFFER8")
(define-foreign-variable gl:draw-buffer9 int "GL_DRAW_BUFFER9")
(define-foreign-variable gl:draw-buffer10 int "GL_DRAW_BUFFER10")
(define-foreign-variable gl:draw-buffer11 int "GL_DRAW_BUFFER11")
(define-foreign-variable gl:draw-buffer12 int "GL_DRAW_BUFFER12")
(define-foreign-variable gl:draw-buffer13 int "GL_DRAW_BUFFER13")
(define-foreign-variable gl:draw-buffer14 int "GL_DRAW_BUFFER14")
(define-foreign-variable gl:draw-buffer15 int "GL_DRAW_BUFFER15")
(define-foreign-variable gl:draw-framebuffer-binding int "GL_DRAW_FRAMEBUFFER_BINDING")
(define-foreign-variable gl:read-framebuffer-binding int "GL_READ_FRAMEBUFFER_BINDING")
(define-foreign-variable gl:element-array-buffer-binding int "GL_ELEMENT_ARRAY_BUFFER_BINDING")
(define-foreign-variable gl:renderbuffer-binding int "GL_RENDERBUFFER_BINDING")
(define-foreign-variable gl:fragment-shader-derivative-hint int "GL_FRAGMENT_SHADER_DERIVATIVE_HINT")
(define-foreign-variable gl:line-smooth int "GL_LINE_SMOOTH")
(define-foreign-variable gl:line-smooth-hint int "GL_LINE_SMOOTH_HINT")
(define-foreign-variable gl:line-width int "GL_LINE_WIDTH")
(define-foreign-variable gl:line-width-granularity int "GL_LINE_WIDTH_GRANULARITY")
(define-foreign-variable gl:line-width-range int "GL_LINE_WIDTH_RANGE")
(define-foreign-variable gl:logic-op-mode int "GL_LOGIC_OP_MODE")
(define-foreign-variable gl:max-3d-texture-size int "GL_MAX_3D_TEXTURE_SIZE")
(define-foreign-variable gl:max-clip-distances int "GL_MAX_CLIP_DISTANCES")
(define-foreign-variable gl:max-combined-fragment-uniform-components int "GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS")
(define-foreign-variable gl:max-combined-texture-image-units int "GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS")
(define-foreign-variable gl:max-combined-vertex-uniform-components int "GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS")
(define-foreign-variable gl:max-combined-geometry-uniform-components int "GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS")
(define-foreign-variable gl:max-varying-components int "GL_MAX_VARYING_COMPONENTS")
(define-foreign-variable gl:max-combined-uniform-blocks int "GL_MAX_COMBINED_UNIFORM_BLOCKS")
(define-foreign-variable gl:max-cube-map-texture-size int "GL_MAX_CUBE_MAP_TEXTURE_SIZE")
(define-foreign-variable gl:max-draw-buffers int "GL_MAX_DRAW_BUFFERS")
(define-foreign-variable gl:max-dualsource-draw-buffers int "GL_MAX_DUAL_SOURCE_DRAW_BUFFERS")
(define-foreign-variable gl:max-elements-indices int "GL_MAX_ELEMENTS_INDICES")
(define-foreign-variable gl:max-elements-vertices int "GL_MAX_ELEMENTS_VERTICES")
(define-foreign-variable gl:max-fragment-uniform-components int "GL_MAX_FRAGMENT_UNIFORM_COMPONENTS")
(define-foreign-variable gl:max-fragment-uniform-blocks int "GL_MAX_FRAGMENT_UNIFORM_BLOCKS")
(define-foreign-variable gl:max-fragment-input-components int "GL_MAX_FRAGMENT_INPUT_COMPONENTS")
(define-foreign-variable gl:min-program-texel-offset int "GL_MIN_PROGRAM_TEXEL_OFFSET")
(define-foreign-variable gl:max-program-texel-offset int "GL_MAX_PROGRAM_TEXEL_OFFSET")
(define-foreign-variable gl:max-rectangle-texture-size int "GL_MAX_RECTANGLE_TEXTURE_SIZE")
(define-foreign-variable gl:max-texture-image-units int "GL_MAX_TEXTURE_IMAGE_UNITS")
(define-foreign-variable gl:max-texture-lod-bias int "GL_MAX_TEXTURE_LOD_BIAS")
(define-foreign-variable gl:max-texture-size int "GL_MAX_TEXTURE_SIZE")
(define-foreign-variable gl:max-renderbuffer-size int "GL_MAX_RENDERBUFFER_SIZE")
(define-foreign-variable gl:max-array-texture-layers int "GL_MAX_ARRAY_TEXTURE_LAYERS")
(define-foreign-variable gl:max-texture-buffer-size int "GL_MAX_TEXTURE_BUFFER_SIZE")
(define-foreign-variable gl:max-uniform-block-size int "GL_MAX_UNIFORM_BLOCK_SIZE")
(define-foreign-variable gl:max-varying-floats int "GL_MAX_VARYING_FLOATS")
(define-foreign-variable gl:max-vertex-attribs int "GL_MAX_VERTEX_ATTRIBS")
(define-foreign-variable gl:max-vertex-texture-image-units int "GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS")
(define-foreign-variable gl:max-geometry-texture-image-units int "GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS")
(define-foreign-variable gl:max-vertex-uniform-components int "GL_MAX_VERTEX_UNIFORM_COMPONENTS")
(define-foreign-variable gl:max-vertex-output-components int "GL_MAX_VERTEX_OUTPUT_COMPONENTS")
(define-foreign-variable gl:max-geometry-uniform-components int "GL_MAX_GEOMETRY_UNIFORM_COMPONENTS")
(define-foreign-variable gl:max-sample-mask-words int "GL_MAX_SAMPLE_MASK_WORDS")
(define-foreign-variable gl:max-color-texture-samples int "GL_MAX_COLOR_TEXTURE_SAMPLES")
(define-foreign-variable gl:max-depth-texture-samples int "GL_MAX_DEPTH_TEXTURE_SAMPLES")
(define-foreign-variable gl:max-integer-samples int "GL_MAX_INTEGER_SAMPLES")
(define-foreign-variable gl:max-server-wait-timeout int "GL_MAX_SERVER_WAIT_TIMEOUT")
(define-foreign-variable gl:max-uniform-buffer-bindings int "GL_MAX_UNIFORM_BUFFER_BINDINGS")
(define-foreign-variable gl:max-uniform-block-size int "GL_MAX_UNIFORM_BLOCK_SIZE")
(define-foreign-variable gl:uniform-buffer-offset-alignment int "GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT")
(define-foreign-variable gl:max-vertex-uniform-blocks int "GL_MAX_VERTEX_UNIFORM_BLOCKS")
(define-foreign-variable gl:max-geometry-uniform-blocks int "GL_MAX_GEOMETRY_UNIFORM_BLOCKS")
(define-foreign-variable gl:max-geometry-input-components int "GL_MAX_GEOMETRY_INPUT_COMPONENTS")
(define-foreign-variable gl:max-geometry-output-components int "GL_MAX_GEOMETRY_OUTPUT_COMPONENTS")
(define-foreign-variable gl:max-viewport-dims int "GL_MAX_VIEWPORT_DIMS")
(define-foreign-variable gl:num-compressed-texture-formats int "GL_NUM_COMPRESSED_TEXTURE_FORMATS")
(define-foreign-variable gl:pack-alignment int "GL_PACK_ALIGNMENT")
(define-foreign-variable gl:pack-image-height int "GL_PACK_IMAGE_HEIGHT")
(define-foreign-variable gl:pack-lsb-first int "GL_PACK_LSB_FIRST")
(define-foreign-variable gl:pack-row-length int "GL_PACK_ROW_LENGTH")
(define-foreign-variable gl:pack-skip-images int "GL_PACK_SKIP_IMAGES")
(define-foreign-variable gl:pack-skip-pixels int "GL_PACK_SKIP_PIXELS")
(define-foreign-variable gl:pack-skip-rows int "GL_PACK_SKIP_ROWS")
(define-foreign-variable gl:pack-swap-bytes int "GL_PACK_SWAP_BYTES")
(define-foreign-variable gl:pixel-pack-buffer-binding int "GL_PIXEL_PACK_BUFFER_BINDING")
(define-foreign-variable gl:pixel-unpack-buffer-binding int "GL_PIXEL_UNPACK_BUFFER_BINDING")
(define-foreign-variable gl:point-fade-threshold-size int "GL_POINT_FADE_THRESHOLD_SIZE")
(define-foreign-variable gl:primitive-restart-index int "GL_PRIMITIVE_RESTART_INDEX")
(define-foreign-variable gl:provoking-vertex int "GL_PROVOKING_VERTEX")
(define-foreign-variable gl:point-size int "GL_POINT_SIZE")
(define-foreign-variable gl:point-size-granularity int "GL_POINT_SIZE_GRANULARITY")
(define-foreign-variable gl:point-size-range int "GL_POINT_SIZE_RANGE")
(define-foreign-variable gl:polygon-offset-factor int "GL_POLYGON_OFFSET_FACTOR")
(define-foreign-variable gl:polygon-offset-units int "GL_POLYGON_OFFSET_UNITS")
(define-foreign-variable gl:polygon-offset-fill int "GL_POLYGON_OFFSET_FILL")
(define-foreign-variable gl:polygon-offset-line int "GL_POLYGON_OFFSET_LINE")
(define-foreign-variable gl:polygon-offset-point int "GL_POLYGON_OFFSET_POINT")
(define-foreign-variable gl:polygon-smooth int "GL_POLYGON_SMOOTH")
(define-foreign-variable gl:polygon-smooth-hint int "GL_POLYGON_SMOOTH_HINT")
(define-foreign-variable gl:read-buffer int "GL_READ_BUFFER")
(define-foreign-variable gl:sample-buffers int "GL_SAMPLE_BUFFERS")
(define-foreign-variable gl:sample-coverage-value int "GL_SAMPLE_COVERAGE_VALUE")
(define-foreign-variable gl:sample-coverage-invert int "GL_SAMPLE_COVERAGE_INVERT")
(define-foreign-variable gl:sampleir-binding int "GL_SAMPLER_BINDING")
(define-foreign-variable gl:samples int "GL_SAMPLES")
(define-foreign-variable gl:scissor-box int "GL_SCISSOR_BOX")
(define-foreign-variable gl:scissor-test int "GL_SCISSOR_TEST")
(define-foreign-variable gl:stencil-back-fail int "GL_STENCIL_BACK_FAIL")
(define-foreign-variable gl:stencil-back-func int "GL_STENCIL_BACK_FUNC")
(define-foreign-variable gl:stencil-back-pass-depth-fail int "GL_STENCIL_BACK_PASS_DEPTH_FAIL")
(define-foreign-variable gl:stencil-back-pass-depth-pass int "GL_STENCIL_BACK_PASS_DEPTH_PASS")
(define-foreign-variable gl:stencil-back-ref int "GL_STENCIL_BACK_REF")
(define-foreign-variable gl:stencil-back-value-mask int "GL_STENCIL_BACK_VALUE_MASK")
(define-foreign-variable gl:stencil-back-writemask int "GL_STENCIL_BACK_WRITEMASK")
(define-foreign-variable gl:stencil-clear-value int "GL_STENCIL_CLEAR_VALUE")
(define-foreign-variable gl:stencil-fail int "GL_STENCIL_FAIL")
(define-foreign-variable gl:stencil-func int "GL_STENCIL_FUNC")
(define-foreign-variable gl:stencil-pass-depth-fail int "GL_STENCIL_PASS_DEPTH_FAIL")
(define-foreign-variable gl:stencil-pass-depth-pass int "GL_STENCIL_PASS_DEPTH_PASS")
(define-foreign-variable gl:stencil-ref int "GL_STENCIL_REF")
(define-foreign-variable gl:stencil-test int "GL_STENCIL_TEST")
(define-foreign-variable gl:stencil-value-mask int "GL_STENCIL_VALUE_MASK")
(define-foreign-variable gl:stencil-writemask int "GL_STENCIL_WRITEMASK")
(define-foreign-variable gl:stereo int "GL_STEREO")
(define-foreign-variable gl:subpixel-bits int "GL_SUBPIXEL_BITS")
(define-foreign-variable gl:texture-binding-1d int "GL_TEXTURE_BINDING_1D")
(define-foreign-variable gl:texture-binding-1d-array int "GL_TEXTURE_BINDING_1D_ARRAY")
(define-foreign-variable gl:texture-binding-2d int "GL_TEXTURE_BINDING_2D")
(define-foreign-variable gl:texture-binding-2d-array int "GL_TEXTURE_BINDING_2D_ARRAY")
(define-foreign-variable gl:texture-binding-2d-multisample int "GL_TEXTURE_BINDING_2D_MULTISAMPLE")
(define-foreign-variable gl:texture-binding-2d-multisample-array int "GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY")
(define-foreign-variable gl:texture-binding-3d int "GL_TEXTURE_BINDING_3D")
(define-foreign-variable gl:texture-binding-buffer int "GL_TEXTURE_BINDING_BUFFER")
(define-foreign-variable gl:texture-binding-cube-map int "GL_TEXTURE_BINDING_CUBE_MAP")
(define-foreign-variable gl:texture-binding-rectangle int "GL_TEXTURE_BINDING_RECTANGLE")
(define-foreign-variable gl:texture-compression-hint int "GL_TEXTURE_COMPRESSION_HINT")
(define-foreign-variable gl:timestamp int "GL_TIMESTAMP")
(define-foreign-variable gl:transform-feedback-buffer-binding int "GL_TRANSFORM_FEEDBACK_BUFFER_BINDING")
(define-foreign-variable gl:transform-feedback-buffer-start int "GL_TRANSFORM_FEEDBACK_BUFFER_START")
(define-foreign-variable gl:transform-feedback-buffer-size int "GL_TRANSFORM_FEEDBACK_BUFFER_SIZE")
(define-foreign-variable gl:uniform-buffer-binding int "GL_UNIFORM_BUFFER_BINDING")
(define-foreign-variable gl:uniform-buffer-start int "GL_UNIFORM_BUFFER_START")
(define-foreign-variable gl:uniform-buffer-size int "GL_UNIFORM_BUFFER_SIZE")
(define-foreign-variable gl:uniform-buffer-offset-alignment int "GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT")
(define-foreign-variable gl:unpack-alignment int "GL_UNPACK_ALIGNMENT")
(define-foreign-variable gl:unpack-image-height int "GL_UNPACK_IMAGE_HEIGHT")
(define-foreign-variable gl:unpack-lsb-first int "GL_UNPACK_LSB_FIRST")
(define-foreign-variable gl:unpack-row-length int "GL_UNPACK_ROW_LENGTH")
(define-foreign-variable gl:unpack-skip-images int "GL_UNPACK_SKIP_IMAGES")
(define-foreign-variable gl:unpack-skip-pixels int "GL_UNPACK_SKIP_PIXELS")
(define-foreign-variable gl:unpack-skip-rows int "GL_UNPACK_SKIP_ROWS")
(define-foreign-variable gl:unpack-swap-bytes int "GL_UNPACK_SWAP_BYTES")
(define-foreign-variable gl:num-extensions int "GL_NUM_EXTENSIONS")
(define-foreign-variable gl:major-version int "GL_MAJOR_VERSION")
(define-foreign-variable gl:minor-version int "GL_MINOR_VERSION")
(define-foreign-variable gl:context-flags int "GL_CONTEXT_FLAGS")
(define-foreign-variable gl:vertex-program-point-size int "GL_VERTEX_PROGRAM_POINT_SIZE")
(define-foreign-variable gl:viewport int "GL_VIEWPORT")
(define-foreign-variable gl:framebuffer-attachment-object-type int "GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE")
(define-foreign-variable gl:framebuffer-attachment-object-name int "GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME")
(define-foreign-variable gl:framebuffer-attachment-red-size int "GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE")
(define-foreign-variable gl:framebuffer-attachment-green-size int "GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE")
(define-foreign-variable gl:framebuffer-attachment-blue-size int "GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE")
(define-foreign-variable gl:framebuffer-attachment-alpha-size int "GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE")
(define-foreign-variable gl:framebuffer-attachment-depth-size int "GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE")
(define-foreign-variable gl:framebuffer-attachment-stencil-size int "GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE")
(define-foreign-variable gl:framebuffer-attachment-component-type int "GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE")
(define-foreign-variable gl:framebuffer-attachment-color-encoding int "GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING")
(define-foreign-variable gl:framebuffer-attachment-texture-level int "GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL")
(define-foreign-variable gl:framebuffer-attachment-texture-cubemap-face int "GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE")
(define-foreign-variable gl:framebuffer-attachment-texture-layer int "GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER")
(define-foreign-variable gl:framebuffer-attachment-layered int "GL_FRAMEBUFFER_ATTACHMENT_LAYERED")
(define-foreign-variable gl:sample-position int "GL_SAMPLE_POSITION")
(define-foreign-variable gl:samples int "GL_SAMPLES")
(define-foreign-variable gl:delete-status int "GL_DELETE_STATUS")
(define-foreign-variable gl:link-status int "GL_LINK_STATUS")
(define-foreign-variable gl:validate-status int "GL_VALIDATE_STATUS")
(define-foreign-variable gl:info-log-length int "GL_INFO_LOG_LENGTH")
(define-foreign-variable gl:attached-shaders int "GL_ATTACHED_SHADERS")
(define-foreign-variable gl:active-attributes int "GL_ACTIVE_ATTRIBUTES")
(define-foreign-variable gl:active-attribute-max-length int "GL_ACTIVE_ATTRIBUTE_MAX_LENGTH")
(define-foreign-variable gl:active-uniforms int "GL_ACTIVE_UNIFORMS")
(define-foreign-variable gl:active-uniform-max-length int "GL_ACTIVE_UNIFORM_MAX_LENGTH")
(define-foreign-variable gl:transform-feedback-buffer-mode int "GL_TRANSFORM_FEEDBACK_BUFFER_MODE")
(define-foreign-variable gl:transform-feedback-varyings int "GL_TRANSFORM_FEEDBACK_VARYINGS")
(define-foreign-variable gl:transform-feedback-varying-max-length int "GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH")
(define-foreign-variable gl:geometry-vertices-out int "GL_GEOMETRY_VERTICES_OUT")
(define-foreign-variable gl:geometry-input-type int "GL_GEOMETRY_INPUT_TYPE")
(define-foreign-variable gl:geometry-output-type int "GL_GEOMETRY_OUTPUT_TYPE")
(define-foreign-variable gl:renderbuffer-width int "GL_RENDERBUFFER_WIDTH")
(define-foreign-variable gl:renderbuffer-height int "GL_RENDERBUFFER_HEIGHT")
(define-foreign-variable gl:renderbuffer-internal-format int "GL_RENDERBUFFER_INTERNAL_FORMAT")
(define-foreign-variable gl:renderbuffer-red-size int "GL_RENDERBUFFER_RED_SIZE")
(define-foreign-variable gl:renderbuffer-green-size int "GL_RENDERBUFFER_GREEN_SIZE")
(define-foreign-variable gl:renderbuffer-blue-size int "GL_RENDERBUFFER_BLUE_SIZE")
(define-foreign-variable gl:renderbuffer-alpha-size int "GL_RENDERBUFFER_ALPHA_SIZE")
(define-foreign-variable gl:renderbuffer-depth-size int "GL_RENDERBUFFER_DEPTH_SIZE")
(define-foreign-variable gl:renderbuffer-stencil-size int "GL_RENDERBUFFER_STENCIL_SIZE")
(define-foreign-variable gl:renderbuffer-samples int "GL_RENDERBUFFER_SAMPLES")
(define-foreign-variable gl:texture-mag-filter int "GL_TEXTURE_MAG_FILTER")
(define-foreign-variable gl:texture-min-filter int "GL_TEXTURE_MIN_FILTER")
(define-foreign-variable gl:texture-min-lod int "GL_TEXTURE_MIN_LOD")
(define-foreign-variable gl:texture-max-lod int "GL_TEXTURE_MAX_LOD")
(define-foreign-variable gl:texture-wrap-s int "GL_TEXTURE_WRAP_S")
(define-foreign-variable gl:texture-wrap-t int "GL_TEXTURE_WRAP_T")
(define-foreign-variable gl:texture-wrap-r int "GL_TEXTURE_WRAP_R")
(define-foreign-variable gl:texture-border-color int "GL_TEXTURE_BORDER_COLOR")
(define-foreign-variable gl:texture-compare-mode int "GL_TEXTURE_COMPARE_MODE")
(define-foreign-variable gl:texture-compare-func int "GL_TEXTURE_COMPARE_FUNC")
(define-foreign-variable gl:texture-max-level int "GL_TEXTURE_MAX_LEVEL")
(define-foreign-variable gl:texture-swizzle-r int "GL_TEXTURE_SWIZZLE_R")
(define-foreign-variable gl:texture-swizzle-g int "GL_TEXTURE_SWIZZLE_G")
(define-foreign-variable gl:texture-swizzle-b int "GL_TEXTURE_SWIZZLE_B")
(define-foreign-variable gl:texture-swizzle-a int "GL_TEXTURE_SWIZZLE_A")
(define-foreign-variable gl:texture-swizzle-rgba int "GL_TEXTURE_SWIZZLE_RGBA")
(define-foreign-variable gl:shader-type int "GL_SHADER_TYPE")
(define-foreign-variable gl:compile-status int "GL_COMPILE_STATUS")
(define-foreign-variable gl:shader-source-length int "GL_SHADER_SOURCE_LENGTH")
(define-foreign-variable gl:vendor int "GL_VENDOR")
(define-foreign-variable gl:renderer int "GL_RENDERER")
(define-foreign-variable gl:version int "GL_VERSION")
(define-foreign-variable gl:shading-language-version int "GL_SHADING_LANGUAGE_VERSION")
(define-foreign-variable gl:extensions int "GL_EXTENSIONS")
(define-foreign-variable gl:texture-cubemap-positive-x int "GL_TEXTURE_CUBE_MAP_POSITIVE_X")
(define-foreign-variable gl:texture-cubemap-positive-y int "GL_TEXTURE_CUBE_MAP_POSITIVE_Y")
(define-foreign-variable gl:texture-cubemap-positive-z int "GL_TEXTURE_CUBE_MAP_POSITIVE_Z")
(define-foreign-variable gl:texture-cubemap-negative-x int "GL_TEXTURE_CUBE_MAP_NEGATIVE_X")
(define-foreign-variable gl:texture-cubemap-negative-y int "GL_TEXTURE_CUBE_MAP_NEGATIVE_Y")
(define-foreign-variable gl:texture-cubemap-negative-z int "GL_TEXTURE_CUBE_MAP_NEGATIVE_Z")
(define-foreign-variable gl:stencil-index int "GL_STENCIL_INDEX")
(define-foreign-variable gl:depth-component int "GL_DEPTH_COMPONENT")
(define-foreign-variable gl:depth-stencil int "GL_DEPTH_STENCIL")
(define-foreign-variable gl:red int "GL_RED")
(define-foreign-variable gl:green int "GL_GREEN")
(define-foreign-variable gl:blue int "GL_BLUE")
(define-foreign-variable gl:rg int "GL_RG")
(define-foreign-variable gl:rgb int "GL_RGB")
(define-foreign-variable gl:rgba int "GL_RGBA")
(define-foreign-variable gl:bgr int "GL_BGR")
(define-foreign-variable gl:bgra int "GL_BGRA")
(define-foreign-variable gl:red-integer int "GL_RED_INTEGER")
(define-foreign-variable gl:green-integer int "GL_GREEN_INTEGER")
(define-foreign-variable gl:blue-integer int "GL_BLUE_INTEGER")
(define-foreign-variable gl:rg-integer int "GL_RG_INTEGER")
(define-foreign-variable gl:rgb-integer int "GL_RGB_INTEGER")
(define-foreign-variable gl:rgba-integer int "GL_RGBA_INTEGER")
(define-foreign-variable gl:bgr-integer int "GL_BGR_INTEGER")
(define-foreign-variable gl:bgra-integer int "GL_BGRA_INTEGER"))
