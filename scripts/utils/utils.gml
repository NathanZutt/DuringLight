
function arr_join(arr, sep) {
	var len = array_length(arr)
	if len == 0
		return ""
	s = string(arr[0])
	for (var i = 1; i < len; ++i) {
	    s += sep + string(arr[i])
	}
	return s
}

function IterStruct(_struct) constructor {
	struct = _struct
	names = variable_struct_get_names(self.struct)
	len = array_length(names)
	i = -1

	next = function() {
		i++
		if i >= len
			return undefined
		return variable_struct_get(self.struct, names[i])
	}
	
	key = function(shift=0) {
		var ii = i + shift
        if ii < 0 or ii >= len
            return undefined
		return names[ii]
	}
	
	value = function(shift=0) {
		var ii = i + shift
        if ii < 0 or ii >= len
            return undefined
		return variable_struct_get(self.struct, names[ii])
	}
	
	reset = function() {
		i = -1
	}
}

function IterArray(_arr) constructor {
	arr = _arr
	current_value = undefined
	len = array_length(arr)
	i = -1
	
	if !is_array(_arr)
		test = true
	
	next = function() {
		i++
		if i >= len
			return undefined
		current_value = arr[i]
		return current_value
	}
	
	get = function(shift=0) {
		if i == -1
			throw "\nIterArray.next() wasn't called after creation of IterArray instance\n"
		var ii = i + shift
        if ii < 0 or ii >= len
            return undefined
        return arr[ii]
	}
	
	reset = function() {
		current_value = undefined
		i = -1
	}
}

function IterInstances(_obj) constructor {
	obj = _obj
	current_value = undefined
	len = instance_number(obj)
	i = -1
	
	next = function() {
		i++
		if i >= len
			return undefined
		current_value = instance_find(obj, i)
		return current_value
	}
	
	get = function() {
		if i == -1
			throw "\IterInstances.next() wasn't called after creation of IterArray instance\n"
		return current_value
	}
	
	reset = function() {
		current_value = undefined
		i = -1
	}
}

function value_between(val, min_, max_){
	return (val >= min_) and (val < max_)
}

function approach(val, to, amount) {
	var delta = to - val
	if abs(delta) < amount
		return to
	var sp = amount * sign(delta) 
	return val + sp
}

function array_back(arr) {
    return arr[array_length(arr) - 1]
}

function array_sum(arr) {
	var res = 0
	for (var i = 0; i < array_length(resources); ++i) {
	    res += resources[$i]
	}
	return res
}

function array_has(arr, val) {
	for (var i = 0; i < array_length(arr); ++i) {
	    if val == arr[i]
			return true
	}
	return false
}

function array_count(arr, val) {
	var count = 0
	for (var i = 0; i < array_length(arr); ++i) {
	    if val == arr[i]
			count++
	}
	return count
}

function array_find(arr, val) {
	for (var i = 0; i < array_length(arr); ++i) {
	    if val == arr[i]
			return i
	}
	return -1
}

function array_remove(arr, val) {
	var i = array_find(arr, val)
	if i == -1
		throw " :array_remove: no value in array: " + string(val)
	array_delete(arr, i, 1)
}

function array_choose(arr) {
	var ind = irandom(array_length(arr) - 1)
	return arr[irandom(array_length(arr) - 1)]
}

function array_expand(arr, from) {
	for (var i = 0; i < array_length(from); ++i) {
	    array_push(arr, from[i])
	}
}

function cycle_increase(val, min_, max_) {
	val++
	var inbounds = val < max_
	return val * inbounds + min_ * !inbounds
}

function cycle_decrease(val, min_, max_) {
	val--
	var inboudns = val >= min_
	return val * inboudns + (max_ - 1) * !inboudns
}

// 5 6 4 9 -> 5
// 5 -7 4 9 -> 7
// 4 1 0 5 -> 0
// 6 6 0 6 -> 5
function cycle_change(val, amount, min_, max_) {
	val += amount // 10
	var delta = max_ - min_ // 5
	if val < min_ {
		val = max_ - abs(min_ - val) mod delta + 1
		// workaround for case: 6 6 0 6 -> 5
		if val > max_
			return min_ + 1
		return val
	}
	if val > max_ {
		val = min_ + abs(val - max_) mod delta - 1
		if val < min_
			return max_ - 1
		return val
	}
	return val
}

function chance(p) {
	return random(1) < p
}

function draw_text_custom(xx, yy, text, font, halign, valign) {
	var prev_valign = draw_get_valign()	
	var prev_halign = draw_get_halign()
	var prev_font = draw_get_font()
	if !font
		font = prev_font
	if !halign
		halign = prev_halign
	if !valign
		valign = prev_valign
	draw_set_font(font)
	draw_set_halign(halign)
	draw_set_valign(valign)
	draw_text(xx, yy, text)
	draw_set_font(prev_font)
	draw_set_halign(prev_halign)
	draw_set_valign(prev_valign)
}

function inst_mouse_dir(inst) {
	return point_direction(inst.x, inst.y, mouse_x, mouse_y)
}

function inst_inst_dir(inst, inst_to) {
	return point_direction(inst.x, inst.y, inst_to.x, inst_to.y)
}

function inst_inst_dist(inst, inst_to) {
	return point_distance(inst.x, inst.y, inst_to.x, inst_to.y)
}

function mouse_dir() {
	return point_direction(id.x, id.y, mouse_x, mouse_y)
}

function inst_dir(inst_to) {
	return point_direction(id.x, id.y, inst_to.x, inst_to.y)
}

function inst_dist(inst_to) {
	return point_distance(id.x, id.y, inst_to.x, inst_to.y)
}

function point_dist(xx, yy) {
	return point_distance(id.x, id.y, xx, yy)
}

function point_dir(xx, yy) {
	return point_direction(id.x, id.y, xx, yy)
}

function get_instance_center(inst) {
	var w = sprite_get_width(inst.sprite_index)
	var h = sprite_get_height(inst.sprite_index)
	return new Vec2(inst.x + w * 0.5, inst.y + h * 0.5)
}

function struct_sum(struct) {
	var names = variable_struct_get_names(struct)
	var res = 0
	for(var i = 0; i < array_length(names); ++i) {
		res += struct[$ names[i]]	
	}
	return res
}

global.creation_arguments_struct = {}
function assign_creation_arguments() {
	var argnames = variable_struct_get_names(global.creation_arguments_struct)
	for (var i = 0; i < array_length(argnames); ++i) {
	    var name = argnames[i]
		var val = global.creation_arguments_struct[$ name]
		variable_instance_set(id, name, val)
	}
}

function instance_create_args(xx, yy, layer, obj, args) {
	global.creation_arguments_struct = args
	var inst = instance_create_layer(xx, yy, layer, obj)
	global.creation_arguments_struct = noone
	return inst
}

function draw_text_above_me(text) {
	var fnt_size = font_get_size(draw_get_font())
	var xx = x - sprite_xoffset + sprite_width * 0.5
	var yy = y - sprite_yoffset - sprite_height * 0.1 - fnt_size
	draw_text(xx, yy, text)
}

function foreach(arr, fun, args=[], kwargs={}) {
	for (var i = 0; i < array_length(arr); ++i) {
	    if fun(arr[i], args, kwargs)
			return true
	}
	return false
}

function foreach_instance(obj, fun) {
	for (var i = 0; i < instance_number(obj); ++i) {
	    var inst = instance_find(obj, i)
		if fun(inst)
			return true
	}
	return false
}

function assert_eq(a, b) {
	if a == b {
		return
	}
	throw "\nassert_eq failed\n"
}

function assert_eq_arr(arr, arr1) {
	if array_length(arr) != array_length(arr1)
		throw "\nassert_eq_arr failed: arrays have different sizes"
	for (var i = 0; i < array_length(arr); ++i) {
	    if arr[i] != arr1[i]
			throw "\nassert_eq_arr failed: arrays elements differs at index " + string(i)
	}
}

function collision_line_width(x0, y0, x1, y1, obj, w) {
	// 0, 0, 10, -10, 10 --> 
	//
	var angle = point_direction(x0, y0, x1, y1)
	var angle_factor = (angle mod 180) < 90 ? 1 : -1 // 1
	var half = w * 0.5 // 5
	var xx0 = x0 - half * angle_factor	// 5
	var yy0 = y0 - half					// -5
	var xx1 = x1 - half * angle_factor	// 15
	var yy1 = y1 - half					// 5
	var inst = collision_line(xx0, yy0, xx1, yy1, obj, false, true)
	var xx2 = x0 + half * angle_factor
	var yy2 = y0 + half
	var xx3 = x1 + half * angle_factor
	var yy3 = y1 + half
	
	//if inst
	//	return inst
	//inst = collision_line(xx2, yy2, xx3, yy3, obj, false, true)
	//return inst

	if inst 
		return {inst:inst, x1: xx1, x2: xx2, x3:xx3, x0: xx0, y0: yy0, y1: yy1, y2: yy2, y3: yy3}

	inst = collision_line(xx2, yy2, xx3, yy3, obj_planet_mask, false, true)
	return {inst:inst, x1: xx1, x2: xx2, x3:xx3, x0: xx0, y0: yy0, y1: yy1, y2: yy2, y3: yy3}
}

function make_late_init() {
	alarm[0] = 1
}

function inst_set_pos(inst, xx, yy) {
	inst.x = xx
	inst.y = yy
}

function get_instances(obj) {
    var it = new IterInstances(obj)
    var arr = []
    while it.next()
        array_push(arr, it.get())
    return arr
}
