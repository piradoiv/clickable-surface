#tag Class
Protected Class ClickableSurface
Inherits WebSDKUIControl
	#tag Event
		Sub DrawControlInLayoutEditor(g as graphics)
		  g.DrawingColor = &c000000EE
		  g.FillRectangle(0, 0, g.Width, g.Height)
		  
		  g.DrawingColor = &c000000DD
		  g.DrawRectangle(0, 0, g.Width, g.Height)
		End Sub
	#tag EndEvent

	#tag Event
		Function ExecuteEvent(name as string, parameters as JSONItem) As Boolean
		  Select Case name
		  Case "pressed"
		    RaiseEvent Pressed(parameters.Lookup("posX",  0), parameters.Lookup("posY", 0))
		  End Select
		End Function
	#tag EndEvent

	#tag Event
		Function HandleRequest(Request As WebRequest, Response As WebResponse) As Boolean
		  // Ignored
		  #Pragma Unused Request
		  #Pragma Unused Response
		End Function
	#tag EndEvent

	#tag Event
		Function JavaScriptClassName() As String
		  Return "Example.ClickableSurface"
		End Function
	#tag EndEvent

	#tag Event
		Sub Opening()
		  Me.Style.Cursor = WebStyle.Cursors.Pointer
		  RaiseEvent Opening
		End Sub
	#tag EndEvent

	#tag Event
		Sub Serialize(js as JSONItem)
		  // Ignored
		  #Pragma Unused js
		End Sub
	#tag EndEvent

	#tag Event
		Function SessionCSSURLs(session as WebSession) As String()
		  // Ignored
		  #Pragma Unused session
		End Function
	#tag EndEvent

	#tag Event
		Function SessionHead(session as WebSession) As String
		  // Ignored
		  #Pragma Unused session
		End Function
	#tag EndEvent

	#tag Event
		Function SessionJavascriptURLs(session as WebSession) As String()
		  #Pragma Unused session
		  
		  Static mJSFile As WebFile
		  
		  If mJSFile = Nil Then
		    mJSFile = New WebFile
		    mJSFile.Session = Nil
		    mJSFile.Filename = "ClickableSurface.js"
		    mJSFile.MIMEType = "text/javascript"
		    mJSFile.Data = kJavaScript
		  End If
		  
		  Return Array(mJSFile.URL)
		End Function
	#tag EndEvent


	#tag Hook, Flags = &h0
		Event Opening()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Pressed(posX As Integer, posY As Integer)
	#tag EndHook


	#tag Constant, Name = kJavaScript, Type = String, Dynamic = False, Default = \"\"use strict\";\nvar Example;\n(function (Example) {\n    class ClickableSurface extends XojoWeb.XojoVisualControl {\n        constructor(id\x2C events) {\n            super(id\x2C events);\n            const el \x3D this.DOMElement(\'\');\n            if (!el)\n                return;\n            el.addEventListener(\'pointerup\'\x2C (ev) \x3D> {\n                const data \x3D new XojoWeb.JSONItem();\n                data.set(\'posX\'\x2C ev.offsetX);\n                data.set(\'posY\'\x2C ev.offsetY);\n                this.triggerServerEvent(\'pressed\'\x2C data\x2C false);\n            });\n        }\n        updateControl(data) {\n            super.updateControl(data);\n            this.refresh();\n        }\n        render() {\n            super.render();\n            const el \x3D this.DOMElement(\'\');\n            if (!el)\n                return;\n            this.setAttributes(el);\n            el.style.display \x3D this.mEnabled && this.mVisible \? \'block\' : \'none\';\n            this.applyTooltip(el);\n            this.applyUserStyle(el);\n        }\n    }\n    Example.ClickableSurface \x3D ClickableSurface;\n})(Example || (Example \x3D {}));\n", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="_mPanelIndex"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="34"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockHorizontal"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockVertical"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ControlID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="_mName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Visual Controls"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Visual Controls"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Indicator"
			Visible=true
			Group="Visual Controls"
			InitialValue=""
			Type="WebUIControl.Indicators"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Primary"
				"2 - Secondary"
				"3 - Success"
				"4 - Danger"
				"5 - Warning"
				"6 - Info"
				"7 - Light"
				"8 - Dark"
				"9 - Link"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
