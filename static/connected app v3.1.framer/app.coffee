# Import file "connected app ui concepting v3" (sizes and positions are scaled 1:2)
sketch = Framer.Importer.load("imported/connected app ui concepting v3@2x")


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
	
	

# 
# showSlider = (parentLayer, alignWithSiblingLayerBG, alignWithSiblingLayerHandle, sliderValueKey) ->
# 
# 	slider = new SliderComponent
# 	parentLayer.addChild(slider)
# 
# 	slider.x = alignWithSiblingLayerBG.x
# 	slider.y = alignWithSiblingLayerBG.y
# 	slider.width = alignWithSiblingLayerBG.width
# 	slider.height = alignWithSiblingLayerBG.height
# 	slider.knobSize = alignWithSiblingLayerBG.height
# # 	slider.animateToValue(sliderValue[sliderValueKey])
# 	slider.value = sliderValue[sliderValueKey]
# 	slider.knob.on "change:x", ->
# 		if slider.knob.x < -62
# 			slider.knob.x = -62
# 
# 		if slider.knob.x > 434
# 			slider.knob.x = 434
# 		
# 		sliderValue[sliderValueKey] = slider.value
# 
# 		alignWithSiblingLayerHandle.x = slider.knob.x + (slider.knob.width*.5) + (alignWithSiblingLayerHandle.width*.5)
# 				
# 	
# 	slider.opacity = .001
# 	if slider.knob.x < -62
# 		slider.knob.x = -62
# 	if slider.knob.x > 434
# 		slider.knob.x = 434
# 	alignWithSiblingLayerHandle.x = slider.knob.x + (slider.knob.width*.5) + (alignWithSiblingLayerHandle.width*.5)
# 	
# 	return slider
# 	


footerButtons = [sketch.button_control_panel, sketch.button_voice_control, sketch.button_connected, sketch.button_more]

footerButtonsSelected = [sketch.button_control_panel_selected, sketch.button_voice_control_selected, sketch.button_connected_selected, sketch.button_more_selected]


selectFooterButton = (selectedIndex) ->
	for button, i in footerButtons
		if i != selectedIndex
			button.visible = true
		else
			button.visible = false

	for button, i in footerButtonsSelected
		if i != selectedIndex
			button.visible = false
		else
			button.visible = true


sketch.button_control_panel_selected.on Events.Click, (event, layer) -> 
	selectFooterButton(0)
	showControlPanelDevicesListContinue()

sketch.button_control_panel.on Events.Click, (event, layer) -> 
	selectFooterButton(0)
	showControlPanelDevicesListContinue()

sketch.button_voice_control.on Events.Click, (event, layer) -> 
	selectFooterButton(1)
	showVoiceControl()

sketch.button_connected.on Events.Click, (event, layer) -> 
	selectFooterButton(2)
	showConnected()

sketch.button_more.on Events.Click, (event, layer) -> 
	selectFooterButton(3)
	showMore()


# ===========================
#
# SCREEN 1 - Control Panel - Devices
#
# ===========================
heightOffset = sketch.Device_Filter.height


# list of devices 
devices = [sketch.Selected_Device_in_Device_List,
sketch.Not_Selected_Device_in_Device_List,
sketch.Out_of_Range_Device_in_Device_List,
sketch.Locked_Device_in_Device_List_Copy
]


selectedTempList = 3

selectTemperatureList = () ->
	
	# hide labels
	sketch.temp_list_1_icon.visible = false
	sketch.temp_list_1_label.visible = false
	sketch.temp_list_2_icon.visible = false
	sketch.temp_list_2_label.visible = false
	sketch.temp_list_3_icon.visible = false
	sketch.temp_list_3_label.visible = false
	sketch.temp_list_4_icon.visible = false
	sketch.temp_list_4_label.visible = false
	sketch.temp_list_5_icon.visible = false
	sketch.temp_list_5_label.visible = false

	if selectedTempList == 1
		# move border
		sketch.temp_list_selected.x = sketch.temp_list_1_button.x
		# show label
		sketch.temp_list_1_icon.visible = true
		sketch.temp_list_1_label.visible = true

	if selectedTempList == 2
		# move border
		sketch.temp_list_selected.x = sketch.temp_list_2_button.x
		# show label
		sketch.temp_list_2_icon.visible = true
		sketch.temp_list_2_label.visible = true

	if selectedTempList == 3
		# move border
		sketch.temp_list_selected.x = sketch.temp_list_3_button.x
		# show label
		sketch.temp_list_3_icon.visible = true
		sketch.temp_list_3_label.visible = true

	if selectedTempList == 4
		# move border
		sketch.temp_list_selected.x = sketch.temp_list_4_button.x
		# show label
		sketch.temp_list_4_icon.visible = true
		sketch.temp_list_4_label.visible = true

	if selectedTempList == 5
		# move border
		sketch.temp_list_selected.x = sketch.temp_list_5_button.x
		# show label
		sketch.temp_list_5_icon.visible = true
		sketch.temp_list_5_label.visible = true


selectedBrightList = 3

selectBrightnessList = () ->
	
	# hide labels
	sketch.brightness_list_1_icon.visible = false
	sketch.brightness_list_1_label.visible = false
	sketch.brightness_list_2_icon.visible = false
	sketch.brightness_list_2_label.visible = false
	sketch.brightness_list_3_icon.visible = false
	sketch.brightness_list_3_label.visible = false
	sketch.brightness_list_4_icon.visible = false
	sketch.brightness_list_4_label.visible = false
	sketch.brightness_list_5_icon.visible = false
	sketch.brightness_list_5_label.visible = false

	if selectedBrightList == 1
		# move border
		sketch.brightness_list_selected.x = sketch.brightness_list_1_button.x
		# show label
		sketch.brightness_list_1_icon.visible = true
		sketch.brightness_list_1_label.visible = true

	if selectedBrightList == 2
		# move border
		sketch.brightness_list_selected.x = sketch.brightness_list_2_button.x
		# show label
		sketch.brightness_list_2_icon.visible = true
		sketch.brightness_list_2_label.visible = true

	if selectedBrightList == 3
		# move border
		sketch.brightness_list_selected.x = sketch.brightness_list_3_button.x
		# show label
		sketch.brightness_list_3_icon.visible = true
		sketch.brightness_list_3_label.visible = true

	if selectedBrightList == 4
		# move border
		sketch.brightness_list_selected.x = sketch.brightness_list_4_button.x
		# show label
		sketch.brightness_list_4_icon.visible = true
		sketch.brightness_list_4_label.visible = true

	if selectedBrightList == 5
		# move border
		sketch.brightness_list_selected.x = sketch.brightness_list_5_button.x
		# show label
		sketch.brightness_list_5_icon.visible = true
		sketch.brightness_list_5_label.visible = true


# show screen 1
showControlPanelDevicesListStart = () ->
	flow.showNext(sketch.Control_Panel_Devices)
	showControlPanelDevicesList()

showControlPanelDevicesListContinue = () -> 
# 	flow.showPrevious(sketch.Control_Panel_Devices)
	flow.showNext(sketch.Control_Panel_Devices)
	sketch.control_panel_footer.visible = true
	flow.footer = sketch.control_panel_footer
# 	sketch.device_detail_footer.visible = false
	selectFooterButton(0)

# 	sliderRefs["screen1temp"].value = sliderValue["sliderTempValue"]
# 	sketch.handle_temp.x = sliderRefs["screen1temp"].knob.x + (sliderRefs["screen1temp"].knob.width*.5) + (sketch.handle_temp.width*.5)
# 	
# 	sliderRefs["screen1light"].value = sliderValue["sliderLightValue"]
# 	sketch.handle_light.x = sliderRefs["screen1light"].knob.x + (sliderRefs["screen1light"].knob.width*.5) + (sketch.handle_light.width*.5)

	
	

hideDeviceFilter = () ->
	if sketch.Device_Filter.visible == true
		heightOffset = sketch.Device_Filter.height - 50
		# hide the devices filter
		sketch.Device_Filter.visible = false
		# adjust height of the list based on hidden filter
		for device, i in devices
			device.y -= heightOffset

showDeviceFilter = () ->
	if sketch.Device_Filter.visible == false
		heightOffset = sketch.Device_Filter.height - 50
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
	sketch.Not_Selected_Device_in_Device_List.visible = false
	
	selectFooterButton(0)

	hideDeviceFilter()	

	heightOffset = 0

	sketch.lamp1selectedlabel.on Events.Click, (event, layer) -> 
		sketch.Selected_Device_in_Device_List.visible = false
		sketch.Not_Selected_Device_in_Device_List.visible = true
		offsetHere = sketch.Selected_Device_in_Device_List.height - 122
		for device, i in devices
			device.y -= offsetHere

	

	sketch.lamp1label.on Events.Click, (event, layer) -> 
		sketch.Not_Selected_Device_in_Device_List.visible = false
		sketch.Selected_Device_in_Device_List.visible = true
		offsetHere = sketch.Selected_Device_in_Device_List.height - 122
		for device, i in devices
			device.y += offsetHere


	# start with device list control hidden
	sketch.Selected_Device_in_Device_List.visible = false
	sketch.Not_Selected_Device_in_Device_List.visible = true
	offsetHere = sketch.Selected_Device_in_Device_List.height - 122
	for device, i in devices
		device.y -= offsetHere


	#
	# EVENTS - screen 1
	#
	sketch.button_device_detail.on Events.Click, (event, layer) ->
		showDeviceDeskLamp()

	showingFilter = false
	sketch.icon_search_filter.on Events.Click, (event, layer) ->
		if showingFilter == false
			showDeviceFilter()
			showingFilter = true
		else
			hideDeviceFilter()
			showingFilter = false

	# TABS - Devices 
	sketch.cp_devices_tab1.on Events.Click, (event, layer) ->
		showControlPanelDevicesListContinue()
	sketch.cp_devices_tab2.on Events.Click, (event, layer) ->
		showRoomScenesList()
	sketch.cp_devices_tab3.on Events.Click, (event, layer) ->
		showSmartActionsList()



	# TEMPERATURE

	sketch.temp_list_1_button.on Events.Click, (event, layer) ->
		selectedTempList = 1
		selectTemperatureList()

	sketch.temp_list_2_button.on Events.Click, (event, layer) ->
		selectedTempList = 2
		selectTemperatureList()

	sketch.temp_list_3_button.on Events.Click, (event, layer) ->
		selectedTempList = 3
		selectTemperatureList()

	sketch.temp_list_4_button.on Events.Click, (event, layer) ->
		selectedTempList = 4
		selectTemperatureList()

	sketch.temp_list_5_button.on Events.Click, (event, layer) ->
		selectedTempList = 5
		selectTemperatureList()
		
	selectTemperatureList()




	# BRIGHT

	sketch.brightness_list_1_button.on Events.Click, (event, layer) ->
		selectedBrightList = 1
		selectBrightnessList()

	sketch.brightness_list_2_button.on Events.Click, (event, layer) ->
		selectedBrightList = 2
		selectBrightnessList()

	sketch.brightness_list_3_button.on Events.Click, (event, layer) ->
		selectedBrightList = 3
		selectBrightnessList()

	sketch.brightness_list_4_button.on Events.Click, (event, layer) ->
		selectedBrightList = 4
		selectBrightnessList()

	sketch.brightness_list_5_button.on Events.Click, (event, layer) ->
		selectedBrightList = 5
		selectBrightnessList()

	selectBrightnessList()





			

# 	sketch.icon_add_device.on Events.Click, (event, layer) ->
# 		print "add device"


	# interactive sliders



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
		sketch.select_scene1.opacity = 1
		sketch.select_scene2.opacity = 0.001
		sketch.select_scene3.opacity = 0.001
	if selectedScene == 2
		sketch.select_scene1.opacity = 0.001
		sketch.select_scene2.opacity = 1
		sketch.select_scene3.opacity = 0.001
	if selectedScene == 3
		sketch.select_scene1.opacity = 0.001
		sketch.select_scene2.opacity = 0.001
		sketch.select_scene3.opacity = 1		
	if !selectedScene || selectedScene < 1
		sketch.select_scene1.opacity = 0.001
		sketch.select_scene2.opacity = 0.001
		sketch.select_scene3.opacity = 0.001

# BRIGHT SELECTION

selectedBrightDetail = 3

selectBrightnessDetail = () ->
	
	# hide labels
	sketch.brightness_detail_1_icon.visible = false
	sketch.brightness_detail_1_label.visible = false
	sketch.brightness_detail_2_icon.visible = false
	sketch.brightness_detail_2_label.visible = false
	sketch.brightness_detail_3_icon.visible = false
	sketch.brightness_detail_3_label.visible = false
	sketch.brightness_detail_4_icon.visible = false
	sketch.brightness_detail_4_label.visible = false
	sketch.brightness_detail_5_icon.visible = false
	sketch.brightness_detail_5_label.visible = false

	if selectedBrightDetail == 1
		# move border
		sketch.brightness_detail_selected.x = sketch.brightness_detail_1_button.x
		# show label
		sketch.brightness_detail_1_icon.visible = true
		sketch.brightness_detail_1_label.visible = true

	if selectedBrightDetail == 2
		# move border
		sketch.brightness_detail_selected.x = sketch.brightness_detail_2_button.x
		# show label
		sketch.brightness_detail_2_icon.visible = true
		sketch.brightness_detail_2_label.visible = true

	if selectedBrightDetail == 3
		# move border
		sketch.brightness_detail_selected.x = sketch.brightness_detail_3_button.x
		# show label
		sketch.brightness_detail_3_icon.visible = true
		sketch.brightness_detail_3_label.visible = true

	if selectedBrightDetail == 4
		# move border
		sketch.brightness_detail_selected.x = sketch.brightness_detail_4_button.x
		# show label
		sketch.brightness_detail_4_icon.visible = true
		sketch.brightness_detail_4_label.visible = true

	if selectedBrightDetail == 5
		# move border
		sketch.brightness_detail_selected.x = sketch.brightness_detail_5_button.x
		# show label
		sketch.brightness_detail_5_icon.visible = true
		sketch.brightness_detail_5_label.visible = true


# TEMP SELECTION

selectedTempDetail = 3

selectTemperatureDetail = () ->
	
	# hide labels
	sketch.temp_detail_1_icon.visible = false
	sketch.temp_detail_1_label.visible = false
	sketch.temp_detail_2_icon.visible = false
	sketch.temp_detail_2_label.visible = false
	sketch.temp_detail_3_icon.visible = false
	sketch.temp_detail_3_label.visible = false
	sketch.temp_detail_4_icon.visible = false
	sketch.temp_detail_4_label.visible = false
	sketch.temp_detail_5_icon.visible = false
	sketch.temp_detail_5_label.visible = false

	if selectedTempDetail == 1
		# move border
		sketch.temp_detail_selected.x = sketch.temp_detail_1_button.x
		# show label
		sketch.temp_detail_1_icon.visible = true
		sketch.temp_detail_1_label.visible = true

	if selectedTempDetail == 2
		# move border
		sketch.temp_detail_selected.x = sketch.temp_detail_2_button.x
		# show label
		sketch.temp_detail_2_icon.visible = true
		sketch.temp_detail_2_label.visible = true

	if selectedTempDetail == 3
		# move border
		sketch.temp_detail_selected.x = sketch.temp_detail_3_button.x
		# show label
		sketch.temp_detail_3_icon.visible = true
		sketch.temp_detail_3_label.visible = true

	if selectedTempDetail == 4
		# move border
		sketch.temp_detail_selected.x = sketch.temp_detail_4_button.x
		# show label
		sketch.temp_detail_4_icon.visible = true
		sketch.temp_detail_4_label.visible = true

	if selectedTempDetail == 5
		# move border
		sketch.temp_detail_selected.x = sketch.temp_detail_5_button.x
		# show label
		sketch.temp_detail_5_icon.visible = true
		sketch.temp_detail_5_label.visible = true


showDeviceDeskLampFirstTime = false

# show screen 2	
showDeviceDeskLamp = () ->
# 	sketch.Device_Detail_Light.x = 0
# 	sketch.Device_Detail_Light.y = 0
# 	sketch.control_panel_footer.visible = false
# 	sketch.device_detail_footer.visible = true
# 	flow.footer = sketch.device_detail_footer
	flow.showNext(sketch.Device_Detail_Light)


	if showDeviceDeskLampFirstTime == false
	
		showDeviceDeskLampFirstTime = true


		# interactive sliders
	
	
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
			
		sketch.select_scene1.on Events.Click, (event, layer) ->
			if selectedScene == 1
				selectedScene = 0
			else
				selectedScene = 1
			selectScene()
		sketch.select_scene2.on Events.Click, (event, layer) ->
			if selectedScene == 2
				selectedScene = 0
			else
				selectedScene = 2
			selectScene()
		sketch.select_scene3.on Events.Click, (event, layer) ->
			if selectedScene == 3
				selectedScene = 0
			else
				selectedScene = 3
			selectScene()
			
		selectScene()
		
		
		sketch.temp_detail_1_button.on Events.Click, (event, layer) ->
			selectedTempDetail = 1
			selectTemperatureDetail()
	
		sketch.temp_detail_2_button.on Events.Click, (event, layer) ->
			selectedTempDetail = 2
			selectTemperatureDetail()
	
		sketch.temp_detail_3_button.on Events.Click, (event, layer) ->
			selectedTempDetail = 3
			selectTemperatureDetail()
	
		sketch.temp_detail_4_button.on Events.Click, (event, layer) ->
			selectedTempDetail = 4
			selectTemperatureDetail()
	
		sketch.temp_detail_5_button.on Events.Click, (event, layer) ->
			selectedTempDetail = 5
			selectTemperatureDetail()
			
		selectTemperatureDetail()
		
	
	
		sketch.brightness_detail_1_button.on Events.Click, (event, layer) ->
			selectedBrightDetail = 1
			selectBrightnessDetail()
	
		sketch.brightness_detail_2_button.on Events.Click, (event, layer) ->
			selectedBrightDetail = 2
			selectBrightnessDetail()
	
		sketch.brightness_detail_3_button.on Events.Click, (event, layer) ->
			selectedBrightDetail = 3
			selectBrightnessDetail()
	
		sketch.brightness_detail_4_button.on Events.Click, (event, layer) ->
			selectedBrightDetail = 4
			selectBrightnessDetail()
	
		sketch.brightness_detail_5_button.on Events.Click, (event, layer) ->
			selectedBrightDetail = 5
			selectBrightnessDetail()
			
		selectBrightnessDetail()
	

# ===========================	
#
# SCREEN 3 - Room Scenes List
#
# ===========================
	
# show screen 3
selectedSceneRoomScenes = 0

selectSceneRoomScenes = () ->
	if selectedSceneRoomScenes == 1
		sketch.select_scene1_roomscenes.opacity = 1
		sketch.select_scene2_roomscenes.opacity = 0.001
		sketch.select_scene3_roomscenes.opacity = 0.001
	if selectedSceneRoomScenes == 2
		sketch.select_scene1_roomscenes.opacity = 0.001
		sketch.select_scene2_roomscenes.opacity = 1
		sketch.select_scene3_roomscenes.opacity = 0.001
	if selectedSceneRoomScenes == 3
		sketch.select_scene1_roomscenes.opacity = 0.001
		sketch.select_scene2_roomscenes.opacity = 0.001
		sketch.select_scene3_roomscenes.opacity = 1		
	if !selectedSceneRoomScenes || selectedSceneRoomScenes < 1
		sketch.select_scene1_roomscenes.opacity = 0.001
		sketch.select_scene2_roomscenes.opacity = 0.001
		sketch.select_scene3_roomscenes.opacity = 0.001

showRoomScenesFirstTime = false

showRoomScenesList = () ->
	flow.showNext(sketch.Control_Panel_Room_Scenes)	
	
	if showRoomScenesFirstTime == false
	
		showRoomScenesFirstTime = true
	
		# TABS - RoomScenesList 
		sketch.cp_roomscenes_tab1.on Events.Click, (event, layer) ->
			showControlPanelDevicesListContinue()
		sketch.cp_roomscenes_tab2.on Events.Click, (event, layer) ->
			showRoomScenesList()
		sketch.cp_roomscenes_tab3.on Events.Click, (event, layer) ->
			showSmartActionsList()
	
		# SELECT SCENE...
	
		sketch.select_scene1_roomscenes.on Events.Click, (event, layer) ->
			if selectedSceneRoomScenes == 1
				selectedSceneRoomScenes = 0
			else
				selectedSceneRoomScenes = 1
			selectSceneRoomScenes()
		sketch.select_scene2_roomscenes.on Events.Click, (event, layer) ->
			if selectedSceneRoomScenes == 2
				selectedSceneRoomScenes = 0
			else
				selectedSceneRoomScenes = 2
			selectSceneRoomScenes()
		sketch.select_scene3_roomscenes.on Events.Click, (event, layer) ->
			if selectedSceneRoomScenes == 3
				selectedSceneRoomScenes = 0
			else
				selectedSceneRoomScenes = 3
			selectSceneRoomScenes()
			
		selectSceneRoomScenes()

# 	showRoomScenesListContinue()

	sketch.background_room_scenes.on Events.Click, (event, layer) ->
		showRoomSceneDetail()


		
showRoomScenesListPrevious = () ->
	flow.showNext(sketch.Control_Panel_Room_Scenes)	
	showRoomScenesListContinue()

showRoomScenesListContinue = () ->
	sketch.Device_Detail_Light.x = 0
	sketch.Device_Detail_Light.y = 0
# 	sketch.control_panel_footer.visible = false
# 	sketch.device_detail_footer.visible = true
# 	flow.footer = sketch.device_detail_footer
	

	
# ===========================	
#
# SCREEN 4 - Room Scenes Detail
#
# ===========================
showRoomSceneDetailShown = false

showRoomSceneDetail = () ->
	flow.showNext(sketch.Control_Panel_Scenes_Detail)
	
	if !showRoomSceneDetailShown
		showRoomSceneDetailShown = true
		sketch.button_back_room_scene.on Events.Click, (event, layer) ->
			flow.showPrevious()

	
# ===========================	
#
# SCREEN 5 - Smart Actions List
#
# ===========================

# show screen 2	
showSmartActionsList = () ->
# 	sketch.Device_Detail_Light.x = 0
# 	sketch.Device_Detail_Light.y = 0
# 	sketch.control_panel_footer.visible = false
# 	sketch.device_detail_footer.visible = true
# 	flow.footer = sketch.device_detail_footer
	flow.showNext(sketch.Control_Panel_Smart_Actions)	

	# TABS - SmartActionsList 
	sketch.cp_smartactions_tab1.on Events.Click, (event, layer) ->
		showControlPanelDevicesListContinue()
	sketch.cp_smartactions_tab2.on Events.Click, (event, layer) ->
		showRoomScenesListPrevious()
	sketch.cp_smartactions_tab3.on Events.Click, (event, layer) ->
		showSmartActionsList()

	sketch.background_smart_actions.on Events.Click, (event, layer) ->
		showActionDetail()


# ===========================	
#
# SCREEN 6 - Smart Actions Detail
#
# ===========================
	
showActionDetail = () ->
	flow.showNext(sketch.Control_Panel_Action_Detail)

sketch.button_back_smart_action.on Events.Click, (event, layer) ->
	flow.showPrevious()

# ===========================	
#
# SCREEN 7 - Voice Control
#
# ===========================

showVoiceControl = () ->
	flow.showNext(sketch.Voice_Control)

sketch.button_back_voice_control.on Events.Click, (event, layer) ->
	flow.showPrevious()
	
	
# ===========================	
#
# SCREEN 8 - Connected
#
# ===========================

showConnected = () ->
	flow.showNext(sketch.Connected)

sketch.button_back_connected.on Events.Click, (event, layer) ->
	flow.showPrevious()

sketch.button_more_connected.on Events.Click, (event, layer) ->
	showMore()
	
# ===========================	
#
# SCREEN 9 - More
#
# ===========================

showMore = () ->
	flow.showNext(sketch.More)

sketch.button_back_more.on Events.Click, (event, layer) ->
	flow.showPrevious()

# ===========================
#
# start!
#
# ===========================	
showControlPanelDevicesListStart()