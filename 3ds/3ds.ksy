meta:
  id: file3ds
  file-extension: file3ds
  endian: le
  encoding: ASCII
doc-ref: http://personales.unican.es/camareroc/3ds/3dsformat.pdf
seq:
  - id: main
    type: chunk
types:
  chunk:
    seq:
      - id: chunk_type
        type: u2
        enum: types
      - id: size
        type: u4
      - id: body
        size: size - 6
        type:
          switch-on: chunk_type
          cases:
            'types::main3ds': chunk_properties
            'types::edit3ds': chunk_properties
            'types::material_block': chunk_properties
            'types::texturemap_0': chunk_properties
            'types::bump_map': chunk_properties
            'types::in_tranc': chunk_properties
            'types::triangular_mesh': chunk_properties
            'types::keyf3ds': chunk_properties
            'types::mesh_information_block': chunk_properties
            'types::object_block': chunk_object
            'types::ambient_color': chunk_entry
            'types::diffuse_color': chunk_entry
            'types::specular_color': chunk_entry
            'types::shininess_percent': chunk_entry
            'types::shininess_strength_percent': chunk_entry
            'types::transparency_percent': chunk_entry
            'types::transparency_falloff_percent': chunk_entry
            'types::reflection_blur_percent': chunk_entry
            'types::self_illum': chunk_entry
            'types::vertices_list': chunk_verticles
            'types::mapping_coordinates_list': chunk_mapping_coordinates
            'types::local_coordinate_system': float_arr34
            'types::faces_material_list': chunk_faces_material_list
            'types::faces_description': chunk_faces_description
            'types::smoothing_group_list': chunk_smoothing_group_list
            'types::frames': chunk_frames
            'types::keyf_header': chunk_keyf_header
            'types::object_parameters': chunk_object_parameters
            'types::object_boundbox': float_arr6
            'types::position_track': chunk_position_track
            'types::rotation_track': chunk_rotation_track
            'types::scale_track': chunk_position_track
            'types::object_pivot_point': float_arr3
            'types::render_type': chunk_word
            'types::herarcy_position': chunk_word
            'types::material_name': chunk_string
            'types::object_dummy_name': chunk_string
            'types::mapping_filename': chunk_string
            'types::top': chunk_uint
            'types::percent_int': chunk_word
            'types::mapping_parameters': chunk_word
            'types::bump_map_present': chunk_word
            'types::blur_percent': chunk_float
            'types::percent_float': chunk_float
            'types::wire_thickness': chunk_float
            'types::master_scale': chunk_float
            'types::version': chunk_uint
            'types::left': chunk_uint
            'types::right': chunk_uint
            'types::meshversion': chunk_uint
            'types::keyf_current_time': chunk_uint
            'types::rgb_byte': chunk_rgb_byte
            'types::rgb_byte_gc': chunk_rgb_byte
            'types::rgb_float': chunk_rgb_float
            'types::rgb_float_gc': chunk_rgb_float
  struct_position:
    seq:
      - id: framenum
        type: u2
      - id: unknown
        type: u4
      - id: x
        type: f4
      - id: y
        type: f4
      - id: z
        type: f4
  struct_rotate:
    seq:
      - id: framenum
        type: u2
      - id: unknown
        type: u4
      - id: angle
        type: f4
      - id: x
        type: f4
      - id: y
        type: f4
      - id: z
        type: f4
  int_arr3:
    seq:
      - id: value
        type: u4
        repeat: expr
        repeat-expr: 3
  word_arr3:
    seq:
      - id: value
        type: u2
        repeat: expr
        repeat-expr: 3
  word_arr4:
    seq:
      - id: value
        type: u2
        repeat: expr
        repeat-expr: 4
  float_arr6:
    seq:
      - id: value
        type: f4
        repeat: expr
        repeat-expr: 6
  float_arr4:
    seq:
      - id: value
        type: f4
        repeat: expr
        repeat-expr: 4
  float_arr34:
    seq:
      - id: value
        type: float_arr4
        repeat: expr
        repeat-expr: 3
  float_arr3:
    seq:
      - id: value
        type: f4
        repeat: expr
        repeat-expr: 3
  float_arr2:
    seq:
      - id: value
        type: f4
        repeat: expr
        repeat-expr: 2
  chunk_properties:
    seq:
      - id: properties
        type: chunk
        repeat: eos
  chunk_entry:
    seq:
      - id: properties
        type: chunk
  chunk_object:
    seq:
      - id: name
        type: strz
      - id: properties
        type: chunk
        repeat: eos
  chunk_string:
    seq:
      - id: path
        type: strz
        size-eos: true
  chunk_uint:
    seq:
      - id: value
        type: u4
  chunk_word:
    seq:
      - id: value
        type: u2
  chunk_float:
    seq:
      - id: value
        type: f4
  chunk_verticles:
    seq:
      - id: arr_size
        type: u2
      - id: value
        type: float_arr3
        repeat: expr
        repeat-expr: arr_size
  chunk_mapping_coordinates:
    seq:
      - id: arr_size
        type: u2
      - id: value
        type: float_arr2
        repeat: expr
        repeat-expr: arr_size
  chunk_faces_material_list:
    seq:
      - id: arr_size
        type: u2
      - id: value
        type: word_arr4
        repeat: expr
        repeat-expr: arr_size
      - id: properties
        type: chunk
        repeat: eos
  chunk_faces_description:
    seq:
      - id: name
        type: strz
      - id: arr_size
        type: u2
      - id: faces
        type: u2
        repeat: expr
        repeat-expr: arr_size
  chunk_smoothing_group_list:
    seq:
      - id: smooth
        type: u4
        repeat: eos
  chunk_frames:
    seq:
      - id: start
        type: u4
      - id: end
        type: u4
  chunk_keyf_header:
    seq:
      - id: revision
        type: u2
      - id: name
        type: strz
      - id: frames
        type: u4
  chunk_object_parameters:
    seq:
      - id: name
        type: strz
      - id: flag0
        type: u2
      - id: flag1
        type: u2
      - id: parent
        type: u2
  chunk_position_track:
    seq:
      - id: flags
        type: u2
      - id: unknown0
        type: u2
      - id: unknown1
        type: u2
      - id: unknown2
        type: u2
      - id: unknown3
        type: u2
      - id: keys
        type: u2
      - id: unknown4
        type: u2
      - id: positions
        type: struct_position
        repeat: expr
        repeat-expr: keys
  chunk_rotation_track:
    seq:
      - id: flags
        type: u2
      - id: unknown0
        type: u2
      - id: unknown1
        type: u2
      - id: unknown2
        type: u2
      - id: unknown3
        type: u2
      - id: keys
        type: u2
      - id: unknown4
        type: u2
      - id: rotations
        type: struct_rotate
        repeat: expr
        repeat-expr: keys
  chunk_rgb_byte:
    seq:
      - id: red
        type: u1
      - id: green
        type: u1
      - id: blue
        type: u1
  chunk_rgb_float:
    seq:
      - id: red
        type: f4
      - id: green
        type: f4
      - id: blue
        type: f4
enums:
  types:
    0x0001: top
    0x0002: version
    0x0003: left
    0x0004: right
    0x0005: front
    0x0006: back
    0x0007: user
    0x0009: light
    0x0010: rgb_float
    0x0011: rgb_byte
    0x0012: rgb_byte_gc
    0x0013: rgb_float_gc
    0x0030: percent_int
    0x0031: percent_float
    0x0100: master_scale
    0x1100: background_bitmap
    0x1101: use_background_bitmap
    0x1200: background_oolor
    0x1201: use_background_color
    0x1300: gradient_color
    0x1301: use_gradient_color
    0x1400: shadow_map_bais
    0x1420: shadow_map_size
    0x1450: shadow_map_sample_range
    0x1460: raytrace_bias
    0x1470: raytrace_on
    0x1500: edit_unknw07
    0x2000: edit_unknw13
    0x2100: ambient_color
    0x2200: fog
    0x2201: use_fog
    0x2210: fog_background
    0x2300: distance_queue
    0x2301: use_distance_queue
    0x2302: layered_fog_options
    0x2303: use_layered_fog
    0x2310: dim_background
    0x3d3d: edit3ds
    0x3d3e: meshversion
    0x3e3d: edit_config2
    0x4000: object_block
    0x4010: object_hidden
    0x4012: object_doesnt_cast
    0x4013: matte_object
    0x4015: external_process_on
    0x4017: object_doesnt_receive_shadows
    0x4100: triangular_mesh
    0x4110: vertices_list
    0x4111: vertices_options
    0x4120: faces_material_list
    0x4130: faces_description
    0x4140: mapping_coordinates_list
    0x4150: smoothing_group_list
    0x4160: local_coordinate_system
    0x4165: object_color_in_editor
    0x4170: mapping_standard
    0x4181: external_process_name
    0x4182: external_process_parameters
    0x4600: light
    0x4610: spot_light
    0x4620: light_off
    0x4625: attengulation_on
    0x4627: spot_raytrace
    0x4630: light_shadowed
    0x4641: spot_shadow_map
    0x4650: spos_show_cone
    0x4651: spot_is_rectangular
    0x4652: spot_overshoot
    0x4653: spot_map
    0x4656: spot_roll
    0x4658: spot_raytrace_bais
    0x4659: range_start
    0x465a: range_end
    0x465b: multiplier
    0x4700: camera
    0x4710: obj_unknwn01
    0x4720: obj_unknwn02
    0x4d4d: main3ds
    0x7001: window_settings
    0x7011: window_description_0
    0x7012: window_description_1
    0x7020: mesh_window
    0xa000: material_name
    0xa010: ambient_color
    0xa020: diffuse_color
    0xa030: specular_color
    0xa040: shininess_percent
    0xa041: shininess_strength_percent
    0xa050: transparency_percent
    0xa052: transparency_falloff_percent
    0xa053: reflection_blur_percent
    0xa081: two_sided
    0xa083: add_trans
    0xa084: self_illum
    0xa085: wire_frame_on
    0xa087: wire_thickness
    0xa088: face_map
    0xa08a: in_tranc
    0xa08c: soften
    0xa08e: wire_in_units
    0xa100: render_type
    0xa200: texturemap_0
    0xa204: specular_map
    0xa210: opacity_map
    0xa220: reflection_map
    0xa230: bump_map
    0xa240: transparency_falloff_percent_present
    0xa250: reflection_blur_percent_present
    0xa252: bump_map_present
    0xa300: mapping_filename
    0xa33a: texturemap_1
    0xa33c: shininess_map
    0xa33d: self_illum_map
    0xa33e: mask_for_texture_map0
    0xa340: mask_for_texture_map1
    0xa342: mask_for_opacity_map
    0xa344: mask_for_bump_map
    0xa346: mask_for_shinness_map
    0xa348: mask_for_specular_map
    0xa34a: mask_for_self_illum_map
    0xa34c: mask_for_reflection_map
    0xa351: mapping_parameters
    0xa353: blur_percent
    0xa354: v_scale
    0xa356: u_scale
    0xa358: u_offset
    0xa35a: v_offset
    0xa35c: rotation_angle
    0xa360: rgb_luma_tint_0
    0xa362: rgb_luma_tint_1
    0xa364: rgb_tint_r
    0xa366: rgb_tint_g
    0xa368: rgb_tint_b
    0xafff: material_block
    0xb000: keyf3ds
    0xb00a: keyf_header
    0xb001: ambient_light_information_block
    0xb002: mesh_information_block
    0xb003: camera_information_block
    0xb004: camera_target_information_block
    0xb005: omni_light_information_block
    0xb006: spot_light_target_information_block
    0xb007: spot_light_information_block
    0xb008: frames
    0xb009: keyf_current_time
    0xb010: object_parameters
    0xb011: object_dummy_name
    0xb013: object_pivot_point
    0xb014: object_boundbox
    0xb015: object_morph_angle
    0xb020: position_track
    0xb021: rotation_track
    0xb022: scale_track
    0xb023: fov_track
    0xb024: roll_track
    0xb025: color_track
    0xb026: morph_track
    0xb027: hostport_track
    0xb028: falloff_track
    0xb029: hide_track
    0xb030: herarcy_position
    0xffff: camera
