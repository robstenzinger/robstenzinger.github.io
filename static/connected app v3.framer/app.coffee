# Import file "connected app ui concepting January 12, 2017 v2" (sizes and positions are scaled 1:2)
sketch = Framer.Importer.load("imported/connected app ui concepting January 12, 2017 v2@2x")


# ===========================
#
# SETUP
#
# ===========================

Screen.backgroundColor = "#FFF"	

sliderValue = {}
sliderValue["sliderTempValue"] = 0.25
sliderValue["sliderLightValue"] = 0.55

sliderRefs = {}
sliderRefs["screen1light"] = null
sliderRefs["screen2light"] = null
sliderRefs["screen1temp"] = null
sliderRefs["screen2temp"] = null

# flow enables scrolling, footer, and screens
flow = new FlowComponent


# ===========================
#
# HELPERS
#
# ===========================
	
	


showSlider = (parentLayer, alignWithSiblingLayerBG, alignWithSiblingLayerHandle, sliderValueKey) ->

	slider = new SliderComponent
	parentLayer.addChild(slider)

	slider.x = alignWithSiblingLayerBG.x
	slider.y = alignWithSiblingLayerBG.y
	slider.width = alignWithSiblingLayerBG.width
	slider.height = alignWithSiblingLayerBG.height
	slider.knobSize = alignWithSiblingLayerBG.height
# 	slider.animateToValue(sliderValue[sliderValueKey])
	slider.value = sliderValue[sliderValueKey]
	slider.knob.on "change:x", ->
		if slider.knob.x < -62
			slider.knob.x = -62

		if slider.knob.x > 434
			slider.knob.x = 434
		
		sliderValue[sliderValueKey] = slider.value

		alignWithSiblingLayerHandle.x = slider.knob.x + (slider.knob.width*.5) + (alignWithSiblingLayerHandle.width*.5)
		
# 		slider["handleRef"] = alignWithSiblingLayerHandle;

# 		print "sliderValue[sliderValueKey]: " + sliderValue[sliderValueKey]
# 		print slider.value
		
	
	slider.opacity = .001
	if slider.knob.x < -62
		slider.knob.x = -62
	if slider.knob.x > 434
		slider.knob.x = 434
	alignWithSiblingLayerHandle.x = slider.knob.x + (slider.knob.width*.5) + (alignWithSiblingLayerHandle.width*.5)
	
	return slider
	


# ===========================
#
# SCREEN 1 - Control Panel - Devices
#
# ===========================
heightOffset = sketch.Device_Filter.height

# list of devices 
devices = [sketch.Selected_Device_in_Device_List,
sketch.Not_Selected_Device_in_Device_List,
sketch.Not_Selected_Device_in_Device_List1, sketch.Not_Selected_Device_in_Device_List2,
sketch.Out_of_Range_Device_in_Device_List,
sketch.Locked_Device_in_Device_List_Copy
]

# show screen 1
showControlPanelDevicesListStart = () ->
	flow.showNext(sketch.Control_Panel_Devices)
	showControlPanelDevicesList()

showControlPanelDevicesListContinue = () -> 
	flow.showPrevious(sketch.Control_Panel_Devices)
	sketch.control_panel_footer.visible = true
	flow.footer = sketch.control_panel_footer
	sketch.device_detail_footer.visible = false

	sliderRefs["screen1temp"].value = sliderValue["sliderTempValue"]
	sketch.handle_temp.x = sliderRefs["screen1temp"].knob.x + (sliderRefs["screen1temp"].knob.width*.5) + (sketch.handle_temp.width*.5)
	
	sliderRefs["screen1light"].value = sliderValue["sliderLightValue"]
	sketch.handle_light.x = sliderRefs["screen1light"].knob.x + (sliderRefs["screen1light"].knob.width*.5) + (sketch.handle_light.width*.5)

	
	

hideDeviceFilter = () ->
	if sketch.Device_Filter.visible == true
		heightOffset = sketch.Device_Filter.height
		# hide the devices filter
		sketch.Device_Filter.visible = false
		# adjust height of the list based on hidden filter
		for device, i in devices
			device.y -= heightOffset

showDeviceFilter = () ->
	if sketch.Device_Filter.visible == false
		heightOffset = sketch.Device_Filter.height
		# hide the devices filter
		sketch.Device_Filter.visible = true
		# adjust height of the list based on hidden filter
		for device, i in devices
			device.y += heightOffset

		sketch.filter_lighting_added.visible = false		
		sketch.lighting_filter_selected.visible = false
		sketch.filter_lighting.visible = true

sketch.filter_lighting.on Events.Click, (event, layer) -> 
	sketch.filter_lighting_added.visible = true		
	sketch.lighting_filter_selected.visible = true
	sketch.filter_lighting.visible = false

sketch.button_clear_search.on Events.Click, (event, layer) ->
	sketch.filter_lighting_added.visible = false		
	sketch.lighting_filter_selected.visible = false
	sketch.filter_lighting.visible = true
	

sliderLightValue = 0
sliderTempValue = 0

showControlPanelDevicesList = () ->
	flow.footer = sketch.control_panel_footer
	sketch.control_panel_footer.visible = true
	sketch.Not_Selected_Device_in_Device_List1.visible = false

	hideDeviceFilter()	

	heightOffset = 0

	sketch.lamp1selectedlabel.on Events.Click, (event, layer) -> 
		sketch.Selected_Device_in_Device_List.visible = false
		sketch.Not_Selected_Device_in_Device_List1.visible = true
		offsetHere = sketch.Selected_Device_in_Device_List.height - 100
		for device, i in devices
			device.y -= offsetHere

	

	sketch.lamp1label.on Events.Click, (event, layer) -> 
		sketch.Not_Selected_Device_in_Device_List1.visible = false
		sketch.Selected_Device_in_Device_List.visible = true
		offsetHere = sketch.Selected_Device_in_Device_List.height - 100
		for device, i in devices
			device.y += offsetHere


	#
	# EVENTS - screen 1
	#
	sketch.button_device_detail.on Events.Click, (event, layer) ->
		showDeviceDeskLamp()

	sketch.icon_search_filter.on Events.Click, (event, layer) ->
		showDeviceFilter()

	sketch.icon_add_device.on Events.Click, (event, layer) ->
		print "add device"


	# interactive sliders

	# 
	# light slider 
	#

	sliderRefs["screen1light"] = showSlider(sketch.Selected_Device_in_Device_List, sketch.input_bg_lighting, sketch.handle_light, "sliderLightValue")
	
	# 
	# temperature slider 
	#

	sliderRefs["screen1temp"] = showSlider(sketch.Selected_Device_in_Device_List, sketch.input_bg_temperature, sketch.handle_temp, "sliderTempValue")

	# on/off toggle switches...
	
	sketch.lamp1selectedon.on Events.Click, (event, layer) -> 
		sketch.lamp1selectedon.visible = false
		sketch.lamp1selectedoff.visible = true
		sketch.lamp1on.visible = false
		sketch.lamp1off.visible = true
		sketch.switch_is_on.visible = false
		sketch.switch_is_off.visible = true

	
	sketch.lamp1selectedoff.on Events.Click, (event, layer) -> 
		sketch.lamp1selectedoff.visible = false
		sketch.lamp1selectedon.visible = true
		sketch.lamp1on.visible = true
		sketch.lamp1off.visible = false
		sketch.switch_is_on.visible = true
		sketch.switch_is_off.visible = false	

	
	sketch.lamp1on.on Events.Click, (event, layer) -> 
		sketch.lamp1selectedon.visible = false
		sketch.lamp1selectedoff.visible = true
		sketch.lamp1on.visible = false
		sketch.lamp1off.visible = true
		sketch.switch_is_on.visible = false
		sketch.switch_is_off.visible = true
	
	sketch.lamp1off.on Events.Click, (event, layer) -> 
		sketch.lamp1selectedoff.visible = false
		sketch.lamp1selectedon.visible = true
		sketch.lamp1on.visible = true
		sketch.lamp1off.visible = false
		sketch.switch_is_on.visible = true
		sketch.switch_is_off.visible = false	

	
	
# ===========================	
#
# SCREEN 2 - Device Detail
#
# ===========================
selectedScene = 0

selectScene = () ->
	if selectedScene == 1
		sketch.select_scene1.visible = true
		sketch.select_scene2.visible = false
		sketch.select_scene3.visible = false
	if selectedScene == 2
		sketch.select_scene1.visible = false
		sketch.select_scene2.visible = true
		sketch.select_scene3.visible = false
	if selectedScene == 3
		sketch.select_scene1.visible = false
		sketch.select_scene2.visible = false
		sketch.select_scene3.visible = true		
	if !selectedScene || selectedScene < 1
		sketch.select_scene1.visible = false
		sketch.select_scene2.visible = false
		sketch.select_scene3.visible = false

# show screen 2	
showDeviceDeskLamp = () ->
# 	sketch.Device_Detail_Light.x = 0
# 	sketch.Device_Detail_Light.y = 0
	sketch.control_panel_footer.visible = false
	sketch.device_detail_footer.visible = true
	flow.footer = sketch.device_detail_footer
	flow.showNext(sketch.Device_Detail_Light)



	# interactive sliders
	sliderRefs["screen2light"] = showSlider(sketch.Device_Detail_Light, sketch.input_bg_lighting1, sketch.handle_light1, "sliderLightValue")
	sliderRefs["screen2temp"] = showSlider(sketch.Device_Detail_Light, sketch.input_bg_temperature1, sketch.handle_temp1, "sliderTempValue")

	#
	# EVENTS - screen 2
	#
		
	sketch.button_back.on Events.Click, (event, layer) ->
		showControlPanelDevicesListContinue()
	
	sketch.switch_is_on.on Events.Click, (event, layer) -> 
		sketch.lamp1selectedon.visible = false
		sketch.lamp1selectedoff.visible = true
		sketch.lamp1on.visible = false
		sketch.lamp1off.visible = true
		sketch.switch_is_on.visible = false
		sketch.switch_is_off.visible = true
	
	sketch.switch_is_off.on Events.Click, (event, layer) -> 
		sketch.lamp1selectedoff.visible = false
		sketch.lamp1selectedon.visible = true
		sketch.lamp1on.visible = true
		sketch.lamp1off.visible = false
		sketch.switch_is_on.visible = true
		sketch.switch_is_off.visible = false		
		
	sketch.scene1label.on Events.Click, (event, layer) ->
		if selectedScene == 1
			selectedScene = 0
		else
			selectedScene = 1
		selectScene()
	sketch.scene2label.on Events.Click, (event, layer) ->
		if selectedScene == 2
			selectedScene = 0
		else
			selectedScene = 2
		selectScene()
	sketch.scene3label.on Events.Click, (event, layer) ->
		if selectedScene == 3
			selectedScene = 0
		else
			selectedScene = 3
		selectScene()
		
	selectScene()

# ===========================
#
# start!
#
# ===========================	
showControlPanelDevicesListStart()