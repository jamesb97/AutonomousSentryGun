##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=SentryGun
ConfigurationName      :=Debug
WorkspacePath          :=C:/Users/Owner/Documents/SeniorProject
ProjectPath            :=C:/Users/Owner/Documents/SeniorProject/SentryGun
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=Owner
Date                   :=13/10/2020
CodeLitePath           :="C:/Program Files/CodeLite"
LinkerName             :=C:/MinGW/bin/g++.exe
SharedObjectLinkerName :=C:/MinGW/bin/g++.exe -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="SentryGun.txt"
PCHCompileFlags        :=
MakeDirCommand         :=makedir
RcCmpOptions           := 
RcCompilerName         :=C:/MinGW/bin/windres.exe
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := C:/MinGW/bin/ar.exe rcu
CXX      := C:/MinGW/bin/g++.exe
CC       := C:/MinGW/bin/gcc.exe
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -Wall $(Preprocessors)
ASFLAGS  := 
AS       := C:/MinGW/bin/as.exe


##
## User defined environment variables
##
CodeLiteDir:=C:\Program Files\CodeLite
Objects0=$(IntermediateDirectory)/facedetect.cpp$(ObjectSuffix) $(IntermediateDirectory)/main.cpp$(ObjectSuffix) $(IntermediateDirectory)/FaceDetector.cpp$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

MakeIntermediateDirs:
	@$(MakeDirCommand) "./Debug"


$(IntermediateDirectory)/.d:
	@$(MakeDirCommand) "./Debug"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/facedetect.cpp$(ObjectSuffix): facedetect.cpp $(IntermediateDirectory)/facedetect.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "C:/Users/Owner/Documents/SeniorProject/SentryGun/facedetect.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/facedetect.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/facedetect.cpp$(DependSuffix): facedetect.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/facedetect.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/facedetect.cpp$(DependSuffix) -MM facedetect.cpp

$(IntermediateDirectory)/facedetect.cpp$(PreprocessSuffix): facedetect.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/facedetect.cpp$(PreprocessSuffix) facedetect.cpp

$(IntermediateDirectory)/main.cpp$(ObjectSuffix): main.cpp $(IntermediateDirectory)/main.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "C:/Users/Owner/Documents/SeniorProject/SentryGun/main.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main.cpp$(DependSuffix): main.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/main.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/main.cpp$(DependSuffix) -MM main.cpp

$(IntermediateDirectory)/main.cpp$(PreprocessSuffix): main.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main.cpp$(PreprocessSuffix) main.cpp

$(IntermediateDirectory)/FaceDetector.cpp$(ObjectSuffix): FaceDetector.cpp $(IntermediateDirectory)/FaceDetector.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "C:/Users/Owner/Documents/SeniorProject/SentryGun/FaceDetector.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/FaceDetector.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/FaceDetector.cpp$(DependSuffix): FaceDetector.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/FaceDetector.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/FaceDetector.cpp$(DependSuffix) -MM FaceDetector.cpp

$(IntermediateDirectory)/FaceDetector.cpp$(PreprocessSuffix): FaceDetector.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/FaceDetector.cpp$(PreprocessSuffix) FaceDetector.cpp


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


