
PI = 3.14   # constants *can* be altered...
PI = 3.15   # ...but should not (and generates a warning)



@var = @var || "default_value"
@var ||= "default_value"    # same as preceding



# possible namings

method()
method?()
method!()
method=()

local_variable = 1      # starts lowercase (like methods)
Constant = 1.1          # starts uppercase

@instance_variable = 2  # "global" to an object
@InstanceVariable = 2   # same
@@class_variable = 3    # "global" to a class
@@ClassVariable = 3     # same
$-x = "global_variable" # global to everywhere
$GLOBAL_VARIABLE = 4    # same
$global_variable = 5    # same

# following naming conventions "Ruby convention"
variable_name = 1
CONSTANT = "don't change me"
def method_name()
end
class ClassName
end
module ModuleName
end

