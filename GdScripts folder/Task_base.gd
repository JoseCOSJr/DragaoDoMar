extends Resource
class_name Task_Base

enum TYPES_OF_ACTION {TAKE_PICTURE, GET_OBJ, DELIVERY_OBJ}

@export var actionTypeNeedMake: TYPES_OF_ACTION
@export var howManyNeedMakeAction: int
@export var objNeedAction: String
@export var objtNeededToMakeAction: String
