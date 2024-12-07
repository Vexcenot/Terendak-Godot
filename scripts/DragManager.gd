# DragManager.gd
extends Node

var is_dragging = false  # Tracks if any item is being dragged
var lastworm = false #makes last worm in log turn into winable shit
var winbox = false #checks if cursor in win area
var paused = false #checks if game is paused
var absolutewin = false #skips all other checks for granting victory
var talking = false #dialogue
