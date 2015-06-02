(foreign-declare "#include <GL/glew.h>")
(include "extemp")

(expand-template (a b) `(define-foreign-variable ,a int ,b)
  (gl:true "GL_TRUE")
  (gl:false "GL_FALSE")
  (gl:array-buffer "GL_ARRAY_BUFFER")
  (gl:copy-read-buffer "GL_COPY_READ_BUFFER")
  (gl:copy-write-buffer "GL_COPY_WRITE_BUFFER")
  (gl:element-array-buffer "GL_ELEMENT_ARRAY_BUFFER")
  (gl:pixel-pack-buffer "GL_PIXEL_PACK_BUFFER")
  (gl:pixel-unpack-buffer "GL_PIXEL_UNPACK_BUFFER")
  (gl:texture-buffer "GL_TEXTURE_BUFFER")
  (gl:transform-feedback-buffer "GL_TRANSFORM_FEEDBACK_BUFFER")
  (gl:uniform-buffer "GL_UNIFORM_BUFFER")
  (gl:draw-framebuffer "GL_DRAW_FRAMEBUFFER")
  (gl:read-framebuffer "GL_READ_FRAMEBUFFER")
  (gl:framebuffer "GL_FRAMEBUFFER")
  (gl:renderbuffer "GL_RENDERBUFFER")
  (gl:texture-1d "GL_TEXTURE_1D")
  (gl:texture-2d "GL_TEXTURE_2D")
  (gl:texture-3d "GL_TEXTURE_3D")
  (gl:texture-1d-array "GL_TEXTURE_1D_ARRAY")
  (gl:texture-2d-array "GL_TEXTURE_2D_ARRAY")
  (gl:texture-rectangle "GL_TEXTURE_RECTANGLE")
  (gl:texture-cubemap "GL_TEXTURE_CUBE_MAP")
  (gl:texture-2d-multisample "GL_TEXTURE_2D_MULTISAMPLE")
  (gl:texture-2d-multisample-array "GL_TEXTURE_2D_MULTISAMPLE_ARRAY")
  (gl:func-add "GL_FUNC_ADD")
  (gl:func-subtract "GL_FUNC_SUBTRACT")
  (gl:func-reverse-subtract "GL_FUNC_REVERSE_SUBTRACT")
  (gl:min "GL_MIN")
  (gl:max "GL_MAX")
  (gl:one "GL_ONE")
  (gl:zero "GL_ZERO")
  (gl:src-color "GL_SRC_COLOR")
  (gl:one-minus-src-color "GL_ONE_MINUS_SRC_COLOR")
  (gl:dst-color "GL_DST_COLOR")
  (gl:one-minus-dst-color "GL_ONE_MINUS_DST_COLOR")
  (gl:src-alpha "GL_SRC_ALPHA")
  (gl:one-minus-src-alpha "GL_ONE_MINUS_SRC_ALPHA")
  (gl:dst-alpha "GL_DST_ALPHA")
  (gl:one-minus-dst-alpha "GL_ONE_MINUS_DST_ALPHA")
  (gl:constant-color "GL_CONSTANT_COLOR")
  (gl:one-minus-constant-color "GL_ONE_MINUS_CONSTANT_COLOR")
  (gl:constant-alpha "GL_CONSTANT_ALPHA")
  (gl:one-minus-constant-alpha "GL_ONE_MINUS_CONSTANT_ALPHA")
  (gl:stream-draw "GL_STREAM_DRAW")
  (gl:stream-read "GL_STREAM_READ")
  (gl:stream-copy "GL_STREAM_COPY")
  (gl:static-draw "GL_STATIC_DRAW")
  (gl:static-read "GL_STATIC_READ")
  (gl:static-copy "GL_STATIC_COPY")
  (gl:dynamic-draw "GL_DYNAMIC_DRAW")
  (gl:dynamic-read "GL_DYNAMIC_READ")
  (gl:dynamic-copy "GL_DYNAMIC_COPY")
  (gl:framebuffer-complete "GL_FRAMEBUFFER_COMPLETE")
  (gl:framebuffer-undefined "GL_FRAMEBUFFER_UNDEFINED")
  (gl:framebuffer-incomplete-attachment "GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT")
  (gl:framebuffer-incomplete-missing-attachment "GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT")
  (gl:framebuffer-incomplete-draw-buffer "GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER")
  (gl:framebuffer-incomplete-read-buffer "GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER")
  (gl:framebuffer-unsupported "GL_FRAMEBUFFER_UNSUPPORTED")
  (gl:framebuffer-incomplete-multisample "GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE")
  (gl:framebuffer-incomplete-layer-targets "GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS")
  (gl:clamp-read-color "GL_CLAMP_READ_COLOR")
  (gl:color-buffer-bit "GL_COLOR_BUFFER_BIT")
  (gl:depth-buffer-bit "GL_DEPTH_BUFFER_BIT")
  (gl:stencil-buffer-bit "GL_STENCIL_BUFFER_BIT")
  (gl:vertex-shader "GL_VERTEX_SHADER")
  (gl:geometry-shader "GL_GEOMETRY_SHADER")
  (gl:fragment-shader "GL_FRAGMENT_SHADER")
  (gl:none "GL_NONE")
  (gl:front-left "GL_FRONT_LEFT")
  (gl:front-right "GL_FRONT_RIGHT")
  (gl:back-left "GL_BACK_LEFT")
  (gl:back-right "GL_BACK_RIGHT")
  (gl:front "GL_FRONT")
  (gl:back "GL_BACK")
  (gl:front-and-back "GL_FRONT_AND_BACK")
  (gl:never "GL_NEVER")
  (gl:less "GL_LESS")
  (gl:equal "GL_EQUAL")
  (gl:less-equal "GL_LEQUAL")
  (gl:greater "GL_GREATER")
  (gl:not-equal "GL_NOTEQUAL")
  (gl:greater-equal "GL_GEQUAL")
  (gl:always "GL_ALWAYS")
  (gl:points "GL_POINTS")
  (gl:line-strip "GL_LINE_STRIP")
  (gl:line-loop "GL_LINE_LOOP")
  (gl:lines "GL_LINES")
  (gl:line-strip-adjacency "GL_LINE_STRIP_ADJACENCY")
  (gl:lines-adjacency "GL_LINES_ADJACENCY")
  (gl:triangle-strip "GL_TRIANGLE_STRIP")
  (gl:triangle-fan "GL_TRIANGLE_FAN")
  (gl:triangles "GL_TRIANGLES")
  (gl:triangle-strip-adjacency "GL_TRIANGLE_STRIP_ADJACENCY")
  (gl:triangles-adjacency "GL_TRIANGLES_ADJACENCY")
  (gl:unsigned-byte "GL_UNSIGNED_BYTE")
  (gl:unsigned-short "GL_UNSIGNED_SHORT")
  (gl:unsigned-int "GL_UNSIGNED_INT")
  (gl:float "GL_FLOAT")
  (gl:int "GL_INT")
  (gl:byte "GL_BYTE")
  (gl:short "GL_SHORT")
  (gl:half-float "GL_HALF_FLOAT")
  (gl:unsigned-byte-3-3-2 "GL_UNSIGNED_BYTE_3_3_2")
  (gl:unsigned-byte-2-3-3-rev "GL_UNSIGNED_BYTE_2_3_3_REV")
  (gl:unsigned-short-5-6-5 "GL_UNSIGNED_SHORT_5_6_5")
  (gl:unsigned-short-5-6-5-rev "GL_UNSIGNED_SHORT_5_6_5_REV")
  (gl:unsigned-short-4-4-4-4 "GL_UNSIGNED_SHORT_4_4_4_4")
  (gl:unsigned-short-4-4-4-4-rev "GL_UNSIGNED_SHORT_4_4_4_4_REV")
  (gl:unsigned-short-5-5-5-1 "GL_UNSIGNED_SHORT_5_5_5_1")
  (gl:unsigned-short-1-5-5-5-rev "GL_UNSIGNED_SHORT_1_5_5_5_REV")
  (gl:unsigned-int-8-8-8-8 "GL_UNSIGNED_INT_8_8_8_8")
  (gl:unsigned-int-8-8-8-8-rev "GL_UNSIGNED_INT_8_8_8_8_REV")
  (gl:unsigned-int-10-10-10-2 "GL_UNSIGNED_INT_10_10_10_2")
  (gl:unsigned-int-2-10-10-10-rev "GL_UNSIGNED_INT_2_10_10_10_REV")
  (gl:unsigned-int-24-8 "GL_UNSIGNED_INT_24_8")
  (gl:unsigned-int-10f-11f-11f-rev "GL_UNSIGNED_INT_10F_11F_11F_REV")
  (gl:unsigned-int-5-9-9-9-rev "GL_UNSIGNED_INT_5_9_9_9_REV")
  (gl:float-32-unsigned-int-24-8-rev "GL_FLOAT_32_UNSIGNED_INT_24_8_REV")
  (gl:signed-normalized "GL_SIGNED_NORMALIZED")
  (gl:unsigned-normalized "GL_UNSIGNED_NORMALIZED")
  (gl:blend "GL_BLEND")
  (gl:clip-distance0 "GL_CLIP_DISTANCE0")
  (gl:clip-distance1 "GL_CLIP_DISTANCE1")
  (gl:clip-distance2 "GL_CLIP_DISTANCE2")
  (gl:clip-distance3 "GL_CLIP_DISTANCE3")
  (gl:clip-distance4 "GL_CLIP_DISTANCE4")
  (gl:clip-distance5 "GL_CLIP_DISTANCE5")
  (gl:color-logic-op "GL_COLOR_LOGIC_OP")
  (gl:cull-gace "GL_CULL_FACE")
  (gl:depth-clamp "GL_DEPTH_CLAMP")
  (gl:depth-test "GL_DEPTH_TEST")
  (gl:dither "GL_DITHER")
  (gl:framebuffer-srgb "GL_FRAMEBUFFER_SRGB")
  (gl:line-smooth "GL_LINE_SMOOTH")
  (gl:multisample "GL_MULTISAMPLE")
  (gl:polygon-offset-fill "GL_POLYGON_OFFSET_FILL")
  (gl:polygon-offset-line "GL_POLYGON_OFFSET_LINE")
  (gl:polygon-offset-point "GL_POLYGON_OFFSET_POINT")
  (gl:polygon-smooth "GL_POLYGON_SMOOTH")
  (gl:primitive-restart "GL_PRIMITIVE_RESTART")
  (gl:sample-alpha-to-coverage "GL_SAMPLE_ALPHA_TO_COVERAGE")
  (gl:sample-alpha-to-one "GL_SAMPLE_ALPHA_TO_ONE")
  (gl:sample-coverage "GL_SAMPLE_COVERAGE")
  (gl:scissor-test "GL_SCISSOR_TEST")
  (gl:stencil-test "GL_STENCIL_TEST")
  (gl:texture-cubemap-seamless "GL_TEXTURE_CUBE_MAP_SEAMLESS")
  (gl:program-point-size "GL_PROGRAM_POINT_SIZE")
  (gl:color-attachment0 "GL_COLOR_ATTACHMENT0")
  (gl:color-attachment1 "GL_COLOR_ATTACHMENT1")
  (gl:color-attachment2 "GL_COLOR_ATTACHMENT2")
  (gl:color-attachment3 "GL_COLOR_ATTACHMENT3")
  (gl:color-attachment4 "GL_COLOR_ATTACHMENT4")
  (gl:color-attachment5 "GL_COLOR_ATTACHMENT5")
  (gl:color-attachment6 "GL_COLOR_ATTACHMENT6")
  (gl:color-attachment7 "GL_COLOR_ATTACHMENT7")
  (gl:color-attachment8 "GL_COLOR_ATTACHMENT8")
  (gl:color-attachment9 "GL_COLOR_ATTACHMENT9")
  (gl:color-attachment10 "GL_COLOR_ATTACHMENT10")
  (gl:color-attachment11 "GL_COLOR_ATTACHMENT11")
  (gl:color-attachment12 "GL_COLOR_ATTACHMENT12")
  (gl:color-attachment13 "GL_COLOR_ATTACHMENT13")
  (gl:color-attachment14 "GL_COLOR_ATTACHMENT14")
  (gl:color-attachment15 "GL_COLOR_ATTACHMENT15")
  (gl:depth-attachment "GL_DEPTH_ATTACHMENT")
  (gl:stencil-attachment "GL_STENCIL_ATTACHMENT")
  (gl:depth-stencil-attachment "GL_DEPTH_STENCIL_ATTACHMENT")
  (gl:cw "GL_CW")
  (gl:ccw "GL_CCW")
  (gl:active-texture "GL_ACTIVE_TEXTURE")
  (gl:aliased-line-width-range "GL_ALIASED_LINE_WIDTH_RANGE")
  (gl:smooth-line-width-range "GL_SMOOTH_LINE_WIDTH_RANGE")
  (gl:smooth-line-width-granularity "GL_SMOOTH_LINE_WIDTH_GRANULARITY")
  (gl:array-buffer-binding "GL_ARRAY_BUFFER_BINDING")
  (gl:blend-color "GL_BLEND_COLOR")
  (gl:blend-dst-alpha "GL_BLEND_DST_ALPHA")
  (gl:blend-dst-rgb "GL_BLEND_DST_RGB")
  (gl:blend-equation-rgb "GL_BLEND_EQUATION_RGB")
  (gl:blend-equation-alpha "GL_BLEND_EQUATION_ALPHA")
  (gl:blend-src-alpha "GL_BLEND_SRC_ALPHA")
  (gl:blend-src-rgb "GL_BLEND_SRC_RGB")
  (gl:color-clear-value "GL_COLOR_CLEAR_VALUE")
  (gl:color-logic-op "GL_COLOR_LOGIC_OP")
  (gl:color-writemask "GL_COLOR_WRITEMASK")
  (gl:compressed-texture-formats "GL_COMPRESSED_TEXTURE_FORMATS")
  (gl:cull-face "GL_CULL_FACE")
  (gl:current-program "GL_CURRENT_PROGRAM")
  (gl:depth-clear-value "GL_DEPTH_CLEAR_VALUE")
  (gl:depth-func "GL_DEPTH_FUNC")
  (gl:depth-range "GL_DEPTH_RANGE")
  (gl:depth-test "GL_DEPTH_TEST")
  (gl:depth-writemask "GL_DEPTH_WRITEMASK")
  (gl:dither "GL_DITHER")
  (gl:doublebuffer "GL_DOUBLEBUFFER")
  (gl:draw-buffer "GL_DRAW_BUFFER")
  (gl:draw-buffer0 "GL_DRAW_BUFFER0")
  (gl:draw-buffer1 "GL_DRAW_BUFFER1")
  (gl:draw-buffer2 "GL_DRAW_BUFFER2")
  (gl:draw-buffer3 "GL_DRAW_BUFFER3")
  (gl:draw-buffer4 "GL_DRAW_BUFFER4")
  (gl:draw-buffer5 "GL_DRAW_BUFFER5")
  (gl:draw-buffer6 "GL_DRAW_BUFFER6")
  (gl:draw-buffer7 "GL_DRAW_BUFFER7")
  (gl:draw-buffer8 "GL_DRAW_BUFFER8")
  (gl:draw-buffer9 "GL_DRAW_BUFFER9")
  (gl:draw-buffer10 "GL_DRAW_BUFFER10")
  (gl:draw-buffer11 "GL_DRAW_BUFFER11")
  (gl:draw-buffer12 "GL_DRAW_BUFFER12")
  (gl:draw-buffer13 "GL_DRAW_BUFFER13")
  (gl:draw-buffer14 "GL_DRAW_BUFFER14")
  (gl:draw-buffer15 "GL_DRAW_BUFFER15")
  (gl:draw-framebuffer-binding "GL_DRAW_FRAMEBUFFER_BINDING")
  (gl:read-framebuffer-binding "GL_READ_FRAMEBUFFER_BINDING")
  (gl:element-array-buffer-binding "GL_ELEMENT_ARRAY_BUFFER_BINDING")
  (gl:renderbuffer-binding "GL_RENDERBUFFER_BINDING")
  (gl:fragment-shader-derivative-hint "GL_FRAGMENT_SHADER_DERIVATIVE_HINT")
  (gl:line-smooth "GL_LINE_SMOOTH")
  (gl:line-smooth-hint "GL_LINE_SMOOTH_HINT")
  (gl:line-width "GL_LINE_WIDTH")
  (gl:line-width-granularity "GL_LINE_WIDTH_GRANULARITY")
  (gl:line-width-range "GL_LINE_WIDTH_RANGE")
  (gl:logic-op-mode "GL_LOGIC_OP_MODE")
  (gl:max-3d-texture-size "GL_MAX_3D_TEXTURE_SIZE")
  (gl:max-clip-distances "GL_MAX_CLIP_DISTANCES")
  (gl:max-combined-fragment-uniform-components "GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS")
  (gl:max-combined-texture-image-units "GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS")
  (gl:max-combined-vertex-uniform-components "GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS")
  (gl:max-combined-geometry-uniform-components "GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS")
  (gl:max-varying-components "GL_MAX_VARYING_COMPONENTS")
  (gl:max-combined-uniform-blocks "GL_MAX_COMBINED_UNIFORM_BLOCKS")
  (gl:max-cube-map-texture-size "GL_MAX_CUBE_MAP_TEXTURE_SIZE")
  (gl:max-draw-buffers "GL_MAX_DRAW_BUFFERS")
  (gl:max-dualsource-draw-buffers "GL_MAX_DUAL_SOURCE_DRAW_BUFFERS")
  (gl:max-elements-indices "GL_MAX_ELEMENTS_INDICES")
  (gl:max-elements-vertices "GL_MAX_ELEMENTS_VERTICES")
  (gl:max-fragment-uniform-components "GL_MAX_FRAGMENT_UNIFORM_COMPONENTS")
  (gl:max-fragment-uniform-blocks "GL_MAX_FRAGMENT_UNIFORM_BLOCKS")
  (gl:max-fragment-input-components "GL_MAX_FRAGMENT_INPUT_COMPONENTS")
  (gl:min-program-texel-offset "GL_MIN_PROGRAM_TEXEL_OFFSET")
  (gl:max-program-texel-offset "GL_MAX_PROGRAM_TEXEL_OFFSET")
  (gl:max-rectangle-texture-size "GL_MAX_RECTANGLE_TEXTURE_SIZE")
  (gl:max-texture-image-units "GL_MAX_TEXTURE_IMAGE_UNITS")
  (gl:max-texture-lod-bias "GL_MAX_TEXTURE_LOD_BIAS")
  (gl:max-texture-size "GL_MAX_TEXTURE_SIZE")
  (gl:max-renderbuffer-size "GL_MAX_RENDERBUFFER_SIZE")
  (gl:max-array-texture-layers "GL_MAX_ARRAY_TEXTURE_LAYERS")
  (gl:max-texture-buffer-size "GL_MAX_TEXTURE_BUFFER_SIZE")
  (gl:max-uniform-block-size "GL_MAX_UNIFORM_BLOCK_SIZE")
  (gl:max-varying-floats "GL_MAX_VARYING_FLOATS")
  (gl:max-vertex-attribs "GL_MAX_VERTEX_ATTRIBS")
  (gl:max-vertex-texture-image-units "GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS")
  (gl:max-geometry-texture-image-units "GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS")
  (gl:max-vertex-uniform-components "GL_MAX_VERTEX_UNIFORM_COMPONENTS")
  (gl:max-vertex-output-components "GL_MAX_VERTEX_OUTPUT_COMPONENTS")
  (gl:max-geometry-uniform-components "GL_MAX_GEOMETRY_UNIFORM_COMPONENTS")
  (gl:max-sample-mask-words "GL_MAX_SAMPLE_MASK_WORDS")
  (gl:max-color-texture-samples "GL_MAX_COLOR_TEXTURE_SAMPLES")
  (gl:max-depth-texture-samples "GL_MAX_DEPTH_TEXTURE_SAMPLES")
  (gl:max-integer-samples "GL_MAX_INTEGER_SAMPLES")
  (gl:max-server-wait-timeout "GL_MAX_SERVER_WAIT_TIMEOUT")
  (gl:max-uniform-buffer-bindings "GL_MAX_UNIFORM_BUFFER_BINDINGS")
  (gl:max-uniform-block-size "GL_MAX_UNIFORM_BLOCK_SIZE")
  (gl:uniform-buffer-offset-alignment "GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT")
  (gl:max-vertex-uniform-blocks "GL_MAX_VERTEX_UNIFORM_BLOCKS")
  (gl:max-geometry-uniform-blocks "GL_MAX_GEOMETRY_UNIFORM_BLOCKS")
  (gl:max-geometry-input-components "GL_MAX_GEOMETRY_INPUT_COMPONENTS")
  (gl:max-geometry-output-components "GL_MAX_GEOMETRY_OUTPUT_COMPONENTS")
  (gl:max-viewport-dims "GL_MAX_VIEWPORT_DIMS")
  (gl:num-compressed-texture-formats "GL_NUM_COMPRESSED_TEXTURE_FORMATS")
  (gl:pack-alignment "GL_PACK_ALIGNMENT")
  (gl:pack-image-height "GL_PACK_IMAGE_HEIGHT")
  (gl:pack-lsb-first "GL_PACK_LSB_FIRST")
  (gl:pack-row-length "GL_PACK_ROW_LENGTH")
  (gl:pack-skip-images "GL_PACK_SKIP_IMAGES")
  (gl:pack-skip-pixels "GL_PACK_SKIP_PIXELS")
  (gl:pack-skip-rows "GL_PACK_SKIP_ROWS")
  (gl:pack-swap-bytes "GL_PACK_SWAP_BYTES")
  (gl:pixel-pack-buffer-binding "GL_PIXEL_PACK_BUFFER_BINDING")
  (gl:pixel-unpack-buffer-binding "GL_PIXEL_UNPACK_BUFFER_BINDING")
  (gl:point-fade-threshold-size "GL_POINT_FADE_THRESHOLD_SIZE")
  (gl:primitive-restart-index "GL_PRIMITIVE_RESTART_INDEX")
  (gl:provoking-vertex "GL_PROVOKING_VERTEX")
  (gl:point-size "GL_POINT_SIZE")
  (gl:point-size-granularity "GL_POINT_SIZE_GRANULARITY")
  (gl:point-size-range "GL_POINT_SIZE_RANGE")
  (gl:polygon-offset-factor "GL_POLYGON_OFFSET_FACTOR")
  (gl:polygon-offset-units "GL_POLYGON_OFFSET_UNITS")
  (gl:polygon-offset-fill "GL_POLYGON_OFFSET_FILL")
  (gl:polygon-offset-line "GL_POLYGON_OFFSET_LINE")
  (gl:polygon-offset-point "GL_POLYGON_OFFSET_POINT")
  (gl:polygon-smooth "GL_POLYGON_SMOOTH")
  (gl:polygon-smooth-hint "GL_POLYGON_SMOOTH_HINT")
  (gl:read-buffer "GL_READ_BUFFER")
  (gl:sample-buffers "GL_SAMPLE_BUFFERS")
  (gl:sample-coverage-value "GL_SAMPLE_COVERAGE_VALUE")
  (gl:sample-coverage-invert "GL_SAMPLE_COVERAGE_INVERT")
  (gl:sampleir-binding "GL_SAMPLER_BINDING")
  (gl:samples "GL_SAMPLES")
  (gl:scissor-box "GL_SCISSOR_BOX")
  (gl:scissor-test "GL_SCISSOR_TEST")
  (gl:stencil-back-fail "GL_STENCIL_BACK_FAIL")
  (gl:stencil-back-func "GL_STENCIL_BACK_FUNC")
  (gl:stencil-back-pass-depth-fail "GL_STENCIL_BACK_PASS_DEPTH_FAIL")
  (gl:stencil-back-pass-depth-pass "GL_STENCIL_BACK_PASS_DEPTH_PASS")
  (gl:stencil-back-ref "GL_STENCIL_BACK_REF")
  (gl:stencil-back-value-mask "GL_STENCIL_BACK_VALUE_MASK")
  (gl:stencil-back-writemask "GL_STENCIL_BACK_WRITEMASK")
  (gl:stencil-clear-value "GL_STENCIL_CLEAR_VALUE")
  (gl:stencil-fail "GL_STENCIL_FAIL")
  (gl:stencil-func "GL_STENCIL_FUNC")
  (gl:stencil-pass-depth-fail "GL_STENCIL_PASS_DEPTH_FAIL")
  (gl:stencil-pass-depth-pass "GL_STENCIL_PASS_DEPTH_PASS")
  (gl:stencil-ref "GL_STENCIL_REF")
  (gl:stencil-test "GL_STENCIL_TEST")
  (gl:stencil-value-mask "GL_STENCIL_VALUE_MASK")
  (gl:stencil-writemask "GL_STENCIL_WRITEMASK")
  (gl:stereo "GL_STEREO")
  (gl:subpixel-bits "GL_SUBPIXEL_BITS")
  (gl:texture-binding-1d "GL_TEXTURE_BINDING_1D")
  (gl:texture-binding-1d-array "GL_TEXTURE_BINDING_1D_ARRAY")
  (gl:texture-binding-2d "GL_TEXTURE_BINDING_2D")
  (gl:texture-binding-2d-array "GL_TEXTURE_BINDING_2D_ARRAY")
  (gl:texture-binding-2d-multisample "GL_TEXTURE_BINDING_2D_MULTISAMPLE")
  (gl:texture-binding-2d-multisample-array "GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY")
  (gl:texture-binding-3d "GL_TEXTURE_BINDING_3D")
  (gl:texture-binding-buffer "GL_TEXTURE_BINDING_BUFFER")
  (gl:texture-binding-cube-map "GL_TEXTURE_BINDING_CUBE_MAP")
  (gl:texture-binding-rectangle "GL_TEXTURE_BINDING_RECTANGLE")
  (gl:texture-compression-hint "GL_TEXTURE_COMPRESSION_HINT")
  (gl:timestamp "GL_TIMESTAMP")
  (gl:transform-feedback-buffer-binding "GL_TRANSFORM_FEEDBACK_BUFFER_BINDING")
  (gl:transform-feedback-buffer-start "GL_TRANSFORM_FEEDBACK_BUFFER_START")
  (gl:transform-feedback-buffer-size "GL_TRANSFORM_FEEDBACK_BUFFER_SIZE")
  (gl:uniform-buffer-binding "GL_UNIFORM_BUFFER_BINDING")
  (gl:uniform-buffer-start "GL_UNIFORM_BUFFER_START")
  (gl:uniform-buffer-size "GL_UNIFORM_BUFFER_SIZE")
  (gl:uniform-buffer-offset-alignment "GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT")
  (gl:unpack-alignment "GL_UNPACK_ALIGNMENT")
  (gl:unpack-image-height "GL_UNPACK_IMAGE_HEIGHT")
  (gl:unpack-lsb-first "GL_UNPACK_LSB_FIRST")
  (gl:unpack-row-length "GL_UNPACK_ROW_LENGTH")
  (gl:unpack-skip-images "GL_UNPACK_SKIP_IMAGES")
  (gl:unpack-skip-pixels "GL_UNPACK_SKIP_PIXELS")
  (gl:unpack-skip-rows "GL_UNPACK_SKIP_ROWS")
  (gl:unpack-swap-bytes "GL_UNPACK_SWAP_BYTES")
  (gl:num-extensions "GL_NUM_EXTENSIONS")
  (gl:major-version "GL_MAJOR_VERSION")
  (gl:minor-version "GL_MINOR_VERSION")
  (gl:context-flags "GL_CONTEXT_FLAGS")
  (gl:vertex-program-point-size "GL_VERTEX_PROGRAM_POINT_SIZE")
  (gl:viewport "GL_VIEWPORT")
  (gl:framebuffer-attachment-object-type "GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE")
  (gl:framebuffer-attachment-object-name "GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME")
  (gl:framebuffer-attachment-red-size "GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE")
  (gl:framebuffer-attachment-green-size "GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE")
  (gl:framebuffer-attachment-blue-size "GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE")
  (gl:framebuffer-attachment-alpha-size "GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE")
  (gl:framebuffer-attachment-depth-size "GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE")
  (gl:framebuffer-attachment-stencil-size "GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE")
  (gl:framebuffer-attachment-component-type "GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE")
  (gl:framebuffer-attachment-color-encoding "GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING")
  (gl:framebuffer-attachment-texture-level "GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL")
  (gl:framebuffer-attachment-texture-cubemap-face "GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE")
  (gl:framebuffer-attachment-texture-layer "GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER")
  (gl:framebuffer-attachment-layered "GL_FRAMEBUFFER_ATTACHMENT_LAYERED")
  (gl:sample-position "GL_SAMPLE_POSITION")
  (gl:samples "GL_SAMPLES")
  (gl:delete-status "GL_DELETE_STATUS")
  (gl:link-status "GL_LINK_STATUS")
  (gl:validate-status "GL_VALIDATE_STATUS")
  (gl:info-log-length "GL_INFO_LOG_LENGTH")
  (gl:attached-shaders "GL_ATTACHED_SHADERS")
  (gl:active-attributes "GL_ACTIVE_ATTRIBUTES")
  (gl:active-attribute-max-length "GL_ACTIVE_ATTRIBUTE_MAX_LENGTH")
  (gl:active-uniforms "GL_ACTIVE_UNIFORMS")
  (gl:active-uniform-max-length "GL_ACTIVE_UNIFORM_MAX_LENGTH")
  (gl:transform-feedback-buffer-mode "GL_TRANSFORM_FEEDBACK_BUFFER_MODE")
  (gl:transform-feedback-varyings "GL_TRANSFORM_FEEDBACK_VARYINGS")
  (gl:transform-feedback-varying-max-length "GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH")
  (gl:geometry-vertices-out "GL_GEOMETRY_VERTICES_OUT")
  (gl:geometry-input-type "GL_GEOMETRY_INPUT_TYPE")
  (gl:geometry-output-type "GL_GEOMETRY_OUTPUT_TYPE")
  (gl:renderbuffer-width "GL_RENDERBUFFER_WIDTH")
  (gl:renderbuffer-height "GL_RENDERBUFFER_HEIGHT")
  (gl:renderbuffer-internal-format "GL_RENDERBUFFER_INTERNAL_FORMAT")
  (gl:renderbuffer-red-size "GL_RENDERBUFFER_RED_SIZE")
  (gl:renderbuffer-green-size "GL_RENDERBUFFER_GREEN_SIZE")
  (gl:renderbuffer-blue-size "GL_RENDERBUFFER_BLUE_SIZE")
  (gl:renderbuffer-alpha-size "GL_RENDERBUFFER_ALPHA_SIZE")
  (gl:renderbuffer-depth-size "GL_RENDERBUFFER_DEPTH_SIZE")
  (gl:renderbuffer-stencil-size "GL_RENDERBUFFER_STENCIL_SIZE")
  (gl:renderbuffer-samples "GL_RENDERBUFFER_SAMPLES")
  (gl:texture-mag-filter "GL_TEXTURE_MAG_FILTER")
  (gl:texture-min-filter "GL_TEXTURE_MIN_FILTER")
  (gl:texture-min-lod "GL_TEXTURE_MIN_LOD")
  (gl:texture-max-lod "GL_TEXTURE_MAX_LOD")
  (gl:texture-wrap-s "GL_TEXTURE_WRAP_S")
  (gl:texture-wrap-t "GL_TEXTURE_WRAP_T")
  (gl:texture-wrap-r "GL_TEXTURE_WRAP_R")
  (gl:texture-border-color "GL_TEXTURE_BORDER_COLOR")
  (gl:texture-compare-mode "GL_TEXTURE_COMPARE_MODE")
  (gl:texture-compare-func "GL_TEXTURE_COMPARE_FUNC")
  (gl:texture-max-level "GL_TEXTURE_MAX_LEVEL")
  (gl:texture-swizzle-r "GL_TEXTURE_SWIZZLE_R")
  (gl:texture-swizzle-g "GL_TEXTURE_SWIZZLE_G")
  (gl:texture-swizzle-b "GL_TEXTURE_SWIZZLE_B")
  (gl:texture-swizzle-a "GL_TEXTURE_SWIZZLE_A")
  (gl:texture-swizzle-rgba "GL_TEXTURE_SWIZZLE_RGBA")
  (gl:shader-type "GL_SHADER_TYPE")
  (gl:compile-status "GL_COMPILE_STATUS")
  (gl:shader-source-length "GL_SHADER_SOURCE_LENGTH")
  (gl:vendor "GL_VENDOR")
  (gl:renderer "GL_RENDERER")
  (gl:version "GL_VERSION")
  (gl:shading-language-version "GL_SHADING_LANGUAGE_VERSION")
  (gl:extensions "GL_EXTENSIONS")
  (gl:texture-cubemap-positive-x "GL_TEXTURE_CUBE_MAP_POSITIVE_X")
  (gl:texture-cubemap-positive-y "GL_TEXTURE_CUBE_MAP_POSITIVE_Y")
  (gl:texture-cubemap-positive-z "GL_TEXTURE_CUBE_MAP_POSITIVE_Z")
  (gl:texture-cubemap-negative-x "GL_TEXTURE_CUBE_MAP_NEGATIVE_X")
  (gl:texture-cubemap-negative-y "GL_TEXTURE_CUBE_MAP_NEGATIVE_Y")
  (gl:texture-cubemap-negative-z "GL_TEXTURE_CUBE_MAP_NEGATIVE_Z")
  (gl:stencil-index "GL_STENCIL_INDEX")
  (gl:depth-component "GL_DEPTH_COMPONENT")
  (gl:depth-stencil "GL_DEPTH_STENCIL")
  (gl:red "GL_RED")
  (gl:green "GL_GREEN")
  (gl:blue "GL_BLUE")
  (gl:rg "GL_RG")
  (gl:rgb "GL_RGB")
  (gl:rgba "GL_RGBA")
  (gl:bgr "GL_BGR")
  (gl:bgra "GL_BGRA")
  (gl:red-integer "GL_RED_INTEGER")
  (gl:green-integer "GL_GREEN_INTEGER")
  (gl:blue-integer "GL_BLUE_INTEGER")
  (gl:rg-integer "GL_RG_INTEGER")
  (gl:rgb-integer "GL_RGB_INTEGER")
  (gl:rgba-integer "GL_RGBA_INTEGER")
  (gl:bgr-integer "GL_BGR_INTEGER")
  (gl:bgra-integer "GL_BGRA_INTEGER")
  )
