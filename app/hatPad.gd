extends WindowDialog


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	OS.set_window_title("HatPad g12 Emulator")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var PYTHON = {
	"keywords": [
		"import",
		"false",
		"true"
	],
	"conditionals": [
		"if","while","do","elif","else"
	],
	"commons": [
		"os",
		"sys"
	],
	"single_line_comment": "#",
	"str_char": "\"",
	
	"function": "#c6d400"
}

func load_syntax(lang):
	
	for i in lang["keywords"]:
		$PAD.add_keyword_color(i,"#123456")
	for i in lang["conditionals"]:
		$PAD.add_keyword_color(i, "#e36b6b")
	for i in lang["commons"]:
		$PAD.add_keyword_color(i, "#12d7ff")
		
	$PAD.add_color_region(lang["single_line_comment"], "", "#8c8f8c")
	$PAD.add_color_region(lang["str_char"], lang["str_char"], "#00a313")
		

func _on_langs_item_selected(index):
	if $langs.get_item_text(index) == "python":
		load_syntax(PYTHON)
	elif $langs.get_item_text(index) == "text/reset":
		$PAD.clear_colors()
