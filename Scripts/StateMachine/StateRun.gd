## Virtual base class for all states.
## Extend this class and override its methods to implement a state.
class_name StateRun extends State

@export var SPEED : int

## Called by the state machine when receiving unhandled input events.
func handleInput() -> void:
    pass

## Called by the state machine on the engine's main loop tick.
func process(_delta: float) -> void:
    pass

## Called by the state machine on the engine's physics update tick.
func physicsProcess(delta: float) -> void:
    if (Input.is_action_pressed("left") or
        Input.is_action_pressed("right") or
        Input.is_action_pressed("up") or
        Input.is_action_pressed("down")
        ):
        var direction :=  Vector2(Input.get_axis("left", "right"), Input.get_axis("up", "down"))
        if direction:
            entity.velocity = direction.normalized() * SPEED
        else:
            entity.velocity = entity.velocity.move_toward(Vector2.ZERO, SPEED)
    else:
        finished.emit("StateIdle")

## Called by the state machine upon changing the active state. The `data` parameter
## is a dictionary with arbitrary data the state can use to initialize itself.
func enter(previous_state_path: String, data := {}) -> void:
    pass

## Called by the state machine before changing the active state. Use this function
## to clean up the state.
func exit() -> void:
    pass
