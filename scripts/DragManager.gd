# DragManager.gd
extends Node

var is_dragging = false  # Tracks if any item is being dragged
var lastworm = false #makes last worm in log turn into winable shit
var winbox = false #checks if cursor in win area
var paused = false #checks if game is paused
var absolutewin = false #skips all other checks for granting victory
var talking = false #dialogue

var rina_conversation_1 = false
var dakan_2_intro = false
var mask_equip: bool = false
var chest_quest = false
var chest_quest_complete = false
var dakan_1 = false
