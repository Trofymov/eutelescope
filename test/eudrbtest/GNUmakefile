# Comment this line if you don't want to use GSL 
export USE_GSL=1
#

ObjSuf        = o
SrcSuf        = cc
ExeSuf        =
DllSuf        = so
OutPutOpt     = -o 


# ROOTCFLAGS   := $(shell root-config --cflags)
# ROOTLIBS     := $(shell root-config --libs)
# ROOTGLIBS    := $(shell root-config --glibs)

GSLCFLAGS      := $(shell gsl-config --cflags)
GSLLIBS        := $(shell gsl-config --libs)


# Linux with egcs, gcc 2.9x, gcc 3.x (>= RedHat 5.2)
CXX           = g++
CXXFLAGS      = -g -O -Wall -fPIC
LD            = g++
LDFLAGS       = -O
SOFLAGS       = -shared

CXXFLAGS     += $(ROOTCFLAGS)
LIBS          = $(ROOTLIBS) $(SYSLIBS)
GLIBS         = $(ROOTGLIBS) $(SYSLIBS)

EUTELESCOPECFLAGS = -I$(MARLIN)/include -I$(MARLIN)/packages/Eutelescope/include
EUTELESCOPELIBS   = -L$(MARLIN)/lib -lMarlin -L$(MARLIN)/packages/Eutelescope/lib -lEutelescope

CXXFLAGS += $(EUTELESCOPECFLAGS)
LIBS += $(EUTELESCOPELIBS)

ifdef USE_GSL
CXXFLAGS += -DUSE_GSL $(GSLCFLAGS)
LIBS     += -DUSE_GSL $(GSLLIBS)
endif


#------ LCIO includes and libs -------------------------
CXXFLAGS += -I$(LCIO)/src/cpp/include
LIBS += -L$(LCIO)/lib -llcio -L$(LCIO)/sio/lib -lsio -lz
#--------------------------------------------------------



#------------------------------------------------------------------------------
#objects := $(patsubst %.cc,%.o,$(wildcard *.cc))

HSIMPLEO      = $(patsubst %.$(SrcSuf),%.$(ObjSuf),$(wildcard *.$(SrcSuf)))


#HSIMPLEO      = MyAnalysis.$(ObjSuf) hcalpptana.$(ObjSuf) 
#HSIMPLES      = MyAnalysis.$(SrcSuf) hcalpptana.$(SrcSuf) 

HSIMPLE       = eudrbtest$(ExeSuf)
OBJS          = $(HSIMPLEO)
PROGRAMS      = $(HSIMPLE)

#------------------------------------------------------------------------------

.SUFFIXES: .$(SrcSuf) .$(ObjSuf) .$(DllSuf)

all:            $(PROGRAMS)

$(HSIMPLE):     $(HSIMPLEO)
		$(LD) $(LDFLAGS) $^ $(LIBS) $(OutPutOpt)$@
		@echo "$@ done"


clean:
		@rm -f $(OBJS) core $(HSIMPLE) pedetest.slcio file.root

distclean:      clean
		@rm -f $(PROGRAMS) $(EVENTSO) $(EVENTLIB) *Dict.* *.def *.exp \
		   *.root *.ps *.so .def so_locations
		@rm -rf cxx_repository

.SUFFIXES: .$(SrcSuf)

###

.$(SrcSuf).$(ObjSuf):
	$(CXX) $(CXXFLAGS) -c $<
