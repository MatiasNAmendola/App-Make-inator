#tag Class
Protected Class ilObjectUIGetCheckBox
Inherits ilObjectBase
	#tag Event
		Sub GenerateAndroidCode(theOrigin as string)
		  dim s as string
		  dim tempILUI as ilUIObject
		  
		  s = "public void " + GetCodeName + "()" + EndOfLine
		  
		  s = s + "{" + EndOfLine
		  
		  tempILUI = modCodeGenerator.GetilUIObjectFromNameOnWindow(varControlName, varWindowName)
		  
		  if tempILUI <> nil then
		    
		    s = s + tempILUI.ISCClassLocalAndroidName + " = (CheckBox)this.findViewById(R.id." + tempILUI.ISCClassLocalAndroidName +");" + EndOfLine
		    
		    
		    s = s + "if (" + tempILUI.ISCClassLocalAndroidName + ".isChecked())" + EndOfLine
		    s = s + "{" + EndOfLine
		    s = s + modVariables.VariableObjectFromName(MessageFromVariable).ISCClassLocalAndroidName + " = 1;" + EndOfLine
		    s = s + "}" + EndOfLine
		    s = s + "else" + EndOfLine
		    s = s + "{" + EndOfLine
		    s = s + modVariables.VariableObjectFromName(MessageFromVariable).ISCClassLocalAndroidName + " = 0;" + EndOfLine
		    s = s + "}" + EndOfLine
		    
		    //checkBox.setChecked(!checkBox.isChecked());
		  end if
		  
		  s = s + "//" + GetCodeName + "Done" + EndOfLine
		  
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  setCodeToCallThisObjectForName("Get", GetCodeName + "();")
		  
		  AndroidInsertCodeAtMarker(s, "//EndOfFunctions")
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateFlexWebCode(theOrigin as string)
		  dim s as string
		  dim tempILUI as ilUIObject
		  
		  tempILUI = modCodeGenerator.GetilUIObjectFromNameOnWindow(varControlName, varWindowName)
		  
		  if tempILUI <> nil then
		    
		    s = "private function " + GetCodeName + "():void" + EndOfLine
		    
		    s = s + "{" + EndOfLine
		    
		    s = s + tempILUI.ISCClassLocalFlexName + ".label=" + modVariables.VariableObjectFromName(MessageFromVariable).ISCClassLocalFlexName + ";" + EndOfLine
		    
		    s = s + "//" + GetCodeName + "Done" + EndOfLine
		    
		    s = s + "}" + EndOfLine + EndOfLine
		    
		    setCodeToCallThisObjectForName("Set", GetCodeName + "();")
		    
		    FlexWebInsertCodeAtMarker(s, "//EndOfFunctions")
		    
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateiOSCode(theOrigin as string)
		  dim s as string
		  
		  dim tempILUI as ilUIObject
		  
		  tempILUI = modCodeGenerator.GetilUIObjectFromNameOnWindow(varControlName, varWindowName)
		  
		  if tempILUI <> nil then
		    
		    s = "- (void) " + GetCodeName + " {" + EndOfLine
		    
		    s = s + "[" + tempILUI.ISCClassLocalFlexName  + " setTitle:" + modVariables.VariableObjectFromName(MessageFromVariable).ISCiOSName + " forState:UIControlStateNormal];" + EndOfLine
		    
		    s = s + "//" + GetCodeName + "Done" + EndOfLine
		    s = s + "" + EndOfLine
		    s = s + "}" + EndOfLine + EndOfLine
		    
		    setCodeToCallThisObjectForName("Set", "[self " + GetCodeName + "];")
		    
		    iOSMInsertCodeAtMarker(s, "//EndOfFunctions")
		    
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub GenerateJavaScriptWebCode(theOrigin as string, optional theTarget as integer)
		  dim s as string
		  
		  dim tempILUI as ilUIObject
		  
		  tempILUI = modCodeGenerator.GetilUIObjectFromNameOnWindow(varControlName, varWindowName)
		  
		  s = "function " + GetCodeName + "()" + EndOfLine
		  
		  s = s + "{" + EndOfLine
		  
		  s = s + "var chkboxtext = document.getElementById(""" + tempILUI.ISCClassLocalFlexName + """).checked;" + EndOfLine
		  
		  s = s + "if (chkboxtext === true)" + EndOfLine
		  s = s + "{" + EndOfLine
		  s = s + modVariables.VariableObjectFromName(MessageFromVariable).ISCClassLocalFlexName + " = 1;" + EndOfLine
		  s = s + "}" + EndOfLine
		  s = s + "else" + EndOfLine
		  s = s + "{" + EndOfLine
		  s = s + modVariables.VariableObjectFromName(MessageFromVariable).ISCClassLocalFlexName + " = 0;" + EndOfLine
		  s = s + "}" + EndOfLine
		  
		  s = s + "//" + GetCodeName + "Done" + EndOfLine
		  
		  s = s + "}" + EndOfLine + EndOfLine
		  
		  setCodeToCallThisObjectForName("Get", GetCodeName + "();")
		  
		  HTML5InsertCodeAtMarker(s, "//EndOfFunctions")
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub GeneratePythonDesktopCode(theOrigin as string)
		  dim s as string
		  dim tempILUI as ilUIObject
		  
		  tempILUI = modCodeGenerator.GetilUIObjectFromNameOnWindow(varControlName, varWindowName)
		  
		  if tempILUI <> nil then
		    
		    s = "def " + GetCodeName + "():" + EndOfLine
		    
		    s = s + " " + tempILUI.ISCPythonName + ".set_label(" + modVariables.VariableObjectFromName(MessageFromVariable).ISCPythonName + ")" + EndOfLine
		    
		    s = s + " #" + GetCodeName + "Done" + EndOfLine + EndOfLine
		    
		    setCodeToCallThisObjectForName("Set", GetCodeName + "()")
		    
		    PythonInsertCodeAtMarker(s, "#EndOfFunctions")
		    
		   end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  
		  me.CodeNameBase = "iscGetCheckBox"
		  me.BGColor =  frmProject.kcolUserInterface
		  me.DisplayName = "Get CheckBox"
		  me.DisplayCategory = "User Interface"
		  me.Title = "Get CheckBox"
		  me.Width = 90
		  
		  me.ObjectItems.Append "Get"
		  me.ObjectShowInput.Append true
		  me.ObjectShowOutput.Append false
		  
		  me.ObjectItems.Append "Done"
		  me.ObjectShowInput.Append false
		  me.ObjectShowOutput.Append true
		  
		  RequirevarControlName = true
		  RequirevarWindowName = true
		  RequireMessageFromVariable = true
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="BGColor"
			Group="Behavior"
			InitialValue="&h000000"
			Type="color"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CodeNameBase"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CustomMessage"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DBObjectType"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayCategory"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DisplayName"
			Group="Behavior"
			Type="String"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable1"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable2"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable3"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable4"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable5"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MathVariable6"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MessageFromVariable"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mLocalUniqueID"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OriginVariable"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable1"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable2"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable3"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable4"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable5"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMathVariable6"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireMessageFromVariable"
			Group="Behavior"
			Type="Boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequireOriginVariable"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequirevarControlName"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RequirevarWindowName"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			InheritedFrom="Object"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UniqueID"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseVariableForMessage"
			Group="Behavior"
			Type="boolean"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="varControlName"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="varWindowName"
			Group="Behavior"
			Type="string"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Group="Behavior"
			Type="Integer"
			InheritedFrom="ilObjectBase"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass