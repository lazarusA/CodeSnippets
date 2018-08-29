# Thanks to 
# https://stackoverflow.com/questions/40428931/package-for-listing-version-of-packages-used-in-a-jupyter-notebook
##### Get locally imported modules from current notebook. This is an ugly way to do it, it works, but if someone knows a better one please tell me. 

import pkg_resources
import types
def get_imports():
    for name, val in globals().items():
        if isinstance(val, types.ModuleType):
            name = val.__name__.split(".")[0]

        elif isinstance(val, type):
            name = val.__module__.split(".")[0]
        if name == "PIL":
            name = "Pillow"
        elif name == "sklearn":
            name = "scikit-learn"

        yield name
        
def printRequirements():
    imports = list(set(get_imports()))
    requirements = []
    for m in pkg_resources.working_set:
        if m.project_name in imports and m.project_name!="pip":
            requirements.append((m.project_name, m.version))
    print("--"*25)
    for r in requirements:
        print("... {} ==  {}".format(*r))
    print("__"*25)
    