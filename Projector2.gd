tool
extends Spatial

export var near: float = -1.0
export var far: float = -5.0
export var left: float = -1.0
export var right: float = 1.0
export var top: float = 1.0
export var bottom: float = -1.0
export var texture: Texture

func _ready() -> void:
	var FrustrumVisualization: MeshInstance = $"./FrustrumVisualization"
	var vertices = PoolVector3Array()
	var indices = PoolIntArray()
	var scale: float = far/near
	vertices.push_back(Vector3(left, bottom, near))	
	vertices.push_back(Vector3(right, bottom, near))
	vertices.push_back(Vector3(right, top, near))
	vertices.push_back(Vector3(left, top, near))
	vertices.push_back(Vector3(left * scale, bottom * scale, far))	
	vertices.push_back(Vector3(right * scale, bottom * scale, far))
	vertices.push_back(Vector3(right * scale, top * scale, far))
	vertices.push_back(Vector3(left * scale, top * scale, far))
	
	indices.push_back(0)
	indices.push_back(1)

	indices.push_back(1)
	indices.push_back(2)

	indices.push_back(2)
	indices.push_back(3)

	indices.push_back(3)
	indices.push_back(0)

	indices.push_back(4)	
	indices.push_back(5)

	indices.push_back(5)
	indices.push_back(6)

	indices.push_back(6)
	indices.push_back(7)

	indices.push_back(7)
	indices.push_back(4)
	
	indices.push_back(0)
	indices.push_back(4)
	
	indices.push_back(1)
	indices.push_back(5)
	
	indices.push_back(2)
	indices.push_back(6)
	
	indices.push_back(3)
	indices.push_back(7)
	# Initialize the ArrayMesh.
	var arr_mesh = ArrayMesh.new()
	var arrays = []
	arrays.resize(ArrayMesh.ARRAY_MAX)
	arrays[ArrayMesh.ARRAY_VERTEX] = vertices
	arrays[ArrayMesh.ARRAY_INDEX] = indices
	# Create the Mesh.
	arr_mesh.add_surface_from_arrays(Mesh.PRIMITIVE_LINES, arrays)
	FrustrumVisualization.mesh = arr_mesh
	FrustrumVisualization.material_override = load("res://LineMaterial.tres")

func get_global_transform() -> Transform:
	return global_transform

func get_near() -> float:
	return near
	
func get_far() -> float:
	return far
	
func get_left() -> float:
	return left

func get_right() -> float:
	return right
	
func get_top() -> float:
	return top

func get_bottom() -> float:
	return bottom

func get_texture() -> Texture:
	return texture
