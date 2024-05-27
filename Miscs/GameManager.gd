extends Node

@export var missionsList: Array[Mission]
var missionsArrayInf: Array
var missionsCompleted: Array[String]

func GameOver():
	await get_tree().create_timer(3).timeout
	$GameOver.Switch_Scene()

func Win():
	await get_tree().create_timer(1).timeout
	$Win.Switch_Scene()

# Called when the node enters the scene tree for the first time.
func _ready():
	missionsArrayInf = []
	for x in missionsList:
		var missionInf = {"IdMission": x.idMission, "AmoutMaked": []}
		for y in x.tasksArray:
			missionInf["AmoutMaked"].push_back(0)
		
		missionsArrayInf.push_back(missionInf)


func actionMissionMaked(typeAction, objtActionMaked):
	var missionDontCompleted = missionsList.filter(func(mission): return missionIsCompleted)
	
	for x in missionDontCompleted:
		var idTask = 0
		for y in x.tasksArray:
			if y.actionTypeNeedMake == typeAction && y.objNeedAction == objtActionMaked:
				taskMaked(x.idMission, idTask)
			idTask+=1

func missionIsCompleted(mission):
	var missionInfWant = {"IdMission": mission.idMission, "AmoutMaked": []}
	for x in mission.tasksArray:
		missionInfWant["AmoutMaked"].push_back(0)
	
	return missionsArrayInf.has(func(missionInf): return missionInfWant.hash() == missionInf.hash())

func taskMaked(idMission, idTask):
	var infMission = missionsArrayInf.filter(func(inf): return inf["IdMission"] == idMission).front()
	idMission["AmoutMaked"][idTask]+=1
	
	var missionMaking = missionsList.filter(func(mission): return mission.idMission == idMission).front()
	if missionIsCompleted(missionMaking):
		print("Missão completa!!!")
