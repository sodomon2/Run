#!/usr/bin/lua
--[[!
 @package   run
 @filename  init.lua
 @version   1.0
 @autor     Diaz Urbaneja Victor Diego Alejandro <sodomon2@gmail.com>
 @date      13.05.2020 20:44:25 -04
]]--

-- declaro mis variables globales

lgi     = require('lgi')                -- requiero esta libreria para que me permitira usar GTK
GObject = lgi.GObject                   -- parte de lgi
GLib    = lgi.GLib                      -- para el treeview
Gtk     = lgi.require('Gtk', '3.0')     -- el objeto GTK

assert  = lgi.assert
builder = Gtk.Builder()

assert(builder:add_from_file('run.ui'),"error al cargar el archivo") -- hago un debugger, si este archivo existe (true) enlaso el archivo ejemplo.ui, si no existe (false) imprimo un error
ui = builder.objects

local main_window  = ui.main_window

local buscador     = ui.input_exec
local button_exec  = ui.btn_exec
local button_close = ui.btn_close

-- al presionar el boton button_exec
function button_exec:on_clicked()
	if (buscador.text == "") then
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