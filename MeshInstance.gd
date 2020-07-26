tool
extends MeshInstance

export var projector: NodePath

var projector_node

func _ready() -> void:
	
	projector_node = get_node(projector)
	
	get_surface_material(0).set_shader_param("tex", projector_node.get_texture())
	get_surface_material(0).set_shader_param("near", projector_node.get_near())
	get_surface_material(0).set_shader_param("far", projector_node.get_far())
	get_surface_material(0).set_shader_param("top", projector_node.get_top())
	get_surface_material(0).set_shader_param("bottom", projector_node.get_bottom())
	get_surface_material(0).set_shader_param("right", projector_node.get_top())
	get_surface_material(0).set_shader_param("left", projector_node.get_bottom())
	get_surface_material(0).set_shader_param("light_matrix", projector_node.get_global_transform())
	
func _physics_process(delta: float) -> void:
	
	
	
	get_surface_material(0).set_shader_param("tex", projector_node.get_texture())
	get_surface_material(0).set_shader_param("near", projector_node.get_near())
	get_surface_material(0).set_shader_param("far", projector_node.get_far())
	get_surface_material(0).set_shader_param("top", projector_node.get_top())
	get_surface_material(0).set_shader_param("bottom", projector_node.get_bottom())
	get_surface_material(0).set_shader_param("right", projector_node.get_top())
	get_surface_material(0).set_shader_param("left", projector_node.get_bottom())
	get_surface_material(0).set_shader_param("light_matrix", projector_node.get_global_transform())
	
