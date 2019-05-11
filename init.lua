#!/usr/bin/lua
--[[!
 @package   
 @filename  init.lua
 @version   1.0
 @autor     Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      18.06.2018 16:58:13 -04
]]--

-- declaro mis variables globales

lgi = require('lgi') -- requiero esta libreria para que me permitira usar GTK

GObject = lgi.GObject -- parte de lgi

GLib = lgi.GLib -- para el treeview

Gtk = lgi.require('Gtk', '2.0') -- el objeto GTK

assert = lgi.assert
builder = Gtk.Builder()

assert(builder:add_from_file('run.glade'),"error al cargar el archivo") -- hago un debugger, si este archivo existe (true) enlaso el archivo ejemplo.ui, si no existe (false) imprimo un error
ui = builder.objects

local main_window = ui.main_window

local buscador = ui.input_exec
local button_exec = ui.btn_exec
local button_close = ui.btn_close

-- al presionar el boton button_exec
function button_exec:on_clicked()
	if (buscador.text == "pcmanfm") then
		local dirbase = "$HOME"
		os.execute("pcmanfm " .. dirbase)
	else
		os.execute(buscador.text.." &")
	end
	Gtk:main_quit()
end

-- al presionar el boton button_close
function button_close:on_clicked()
	Gtk.main_quit()
end

-- cierro la ventana cuando se presione boton cerrar (x)
function main_window:on_destroy()
	Gtk.main_quit()
end

main_window:show_all()
Gtk:main()