##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=SemanticSegmentation
ConfigurationName      :=Debug
WorkspacePath          :=C:/Users/Owner/Documents/SeniorProject
ProjectPath            :=C:/Users/Owner/Documents/SeniorProject/SemanticSegmentation
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
ObjectsFileList        :="SemanticSegmentation.txt"
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
Objects0=$(IntermediateDirectory)/Fisherfaces.cpp$(ObjectSuffix) $(IntermediateDirectory)/Historgram.cpp$(ObjectSuffix) $(IntermediateDirectory)/main.c$(ObjectSuffix) $(IntermediateDirectory)/Eigenfaces.cpp$(ObjectSuffix) 



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
$(IntermediateDirectory)/Fisherfaces.cpp$(ObjectSuffix): Fisherfaces.cpp $(IntermediateDirectory)/Fisherfaces.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "C:/Users/Owner/Documents/SeniorProject/SemanticSegmentation/Fisherfaces.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Fisherfaces.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/Fisherfaces.cpp$(DependSuffix): Fisherfaces.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/Fisherfaces.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/Fisherfaces.cpp$(DependSuffix) -MM Fisherfaces.cpp

$(IntermediateDirectory)/Fisherfaces.cpp$(PreprocessSuffix): Fisherfaces.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/Fisherfaces.cpp$(PreprocessSuffix) Fisherfaces.cpp

$(IntermediateDirectory)/Historgram.cpp$(ObjectSuffix): Historgram.cpp $(IntermediateDirectory)/Historgram.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "C:/Users/Owner/Documents/SeniorProject/SemanticSegmentation/Historgram.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Historgram.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/Historgram.cpp$(DependSuffix): Historgram.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/Historgram.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/Historgram.cpp$(DependSuffix) -MM Historgram.cpp

$(IntermediateDirectory)/Historgram.cpp$(PreprocessSuffix): Historgram.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/Historgram.cpp$(PreprocessSuffix) Historgram.cpp

$(IntermediateDirectory)/main.c$(ObjectSuffix): main.c $(IntermediateDirectory)/main.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/Owner/Documents/SeniorProject/SemanticSegmentation/main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main.c$(DependSuffix): main.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/main.c$(ObjectSuffix) -MF$(IntermediateDirectory)/main.c$(DependSuffix) -MM main.c

$(IntermediateDirectory)/main.c$(PreprocessSuffix): main.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main.c$(PreprocessSuffix) main.c

$(IntermediateDirectory)/Eigenfaces.cpp$(ObjectSuffix): Eigenfaces.cpp $(IntermediateDirectory)/Eigenfaces.cpp$(DependSuffix)
	$(CXX) $(IncludePCH) $(SourceSwitch) "C:/Users/Owner/Documents/SeniorProject/SemanticSegmentation/Eigenfaces.cpp" $(CXXFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Eigenfaces.cpp$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/Eigenfaces.cpp$(DependSuffix): Eigenfaces.cpp
	@$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/Eigenfaces.cpp$(ObjectSuffix) -MF$(IntermediateDirectory)/Eigenfaces.cpp$(DependSuffix) -MM Eigenfaces.cpp

$(IntermediateDirectory)/Eigenfaces.cpp$(PreprocessSuffix): Eigenfaces.cpp
	$(CXX) $(CXXFLAGS) $(IncludePCH) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/Eigenfaces.cpp$(PreprocessSuffix) Eigenfaces.cpp


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


