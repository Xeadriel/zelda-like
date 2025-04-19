class_name StateIdle extends State

@export var SLOWDOWNSPEED = 25

## Called by the state machine on the engine's main loop tick.
func process(_delta: float) -> void:
    pass

## Called by the state machine on the engine's physics update tick.
func physicsProcess(delta: float) -> void:
    if (Input.is_action_just_pressed("left") or
        Input.is_action_just_pressed("right") or
        Input.is_action_just_pressed("up") or
        Input.is_action_just_pressed("down")
        ):
        finished.emit("StateRun")
    else:
        entity.velocity = entity.velocity.move_toward(Vector2.ZERO, SLOWDOWNSPEED)

## Called by the state machine upon changing the active state. The `data` parameter
## is a dictionary with arbitrary data the state can use to initialize itself.
func enter(previous_state_path: String, data := {}) -> void:
    pass

## Called by the state machine before changing the active state. Use this function
## to clean up the state.
func exit() -> void:
    pass
