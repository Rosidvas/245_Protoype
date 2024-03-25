# 245_Protoype
Prototype game weapon for LB245. This prototype is based on the flamethrower where the player has the ability to jump mid air with airblasts in exchange of emmiting zero damage to enemies.

## Requirements
| Number  | Description |
| ------------- | ------------- |
| 1 | the player should have normal jump functions and an airblast jump|
| 2 | pressing left click should give the user the ability to jump mid air|
| 3 | the player shouldn't do any damage when shooting flames |
| 4 | the target is on fire but does not receive any damage |

## Decisions
we have decided that requirement 4 will be implemented and tested during further development, since this prototype main goal is the movement and jumps for the class.

## Test Concept

## Testcase specification
| Test number  | requirement number | prerequisites | input | output |
| ------------- | ------------- | ------------ | ------------ | ------------ |
| 1.1 | 1 | game start | spacebar | - |
| 1.2  | 1 | - | right click | - | 
| 2.1 | 2 | player mid-air | right click | Jump Mid-Air |
| 3.1  | 3 | - | left click | Damage Dealt: 0 |
| 4.1  | 4 | - | - | Onfire: True, Damage Dealt: 0 |

## Test protocol
| Date | Test number  | Environment | N/OK | Remarks | Signature | output |
| ------------- | ------------- | ------------ | ------------ | ------------ | ------------ | ------------ |
| 18/03/2024  | 1.1 | Godot | OK | - | Studer | - |
| 18/03/2024  | 1.2 | Godot | OK | - | Studer | - |
| 18/03/2024  | 2.1 | Godot | OK | - | Studer | - |
| 18/03/2024 | 3.1  | Godot | OK | - | Studer | - |
| - | 4.1  | Godot | NOK | - | Studer | - |

## Test report
The functions that are suppose to be added to make the flamethrower works as intended (airblast jumping).
