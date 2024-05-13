extends Node

class_name Statuses

#by default, statuses decrease by 1 each turn

var STRONG = "STRONG" #increases ATK

#var BURN = "BURN" 

var POISION = "POISION" #deals #poision damage

var WEAK = "WEAK" #halves strenth after other buffs

var PARALIZED = "PARALIZE" #Completely disables piece

var HEALING = "HEALING" #gives #healing health per turn

var ENRAGED = "ENRAGED" #Triples damage if your health is low. Happens before weak.

var BOMBED = "BOMBED" #When bombed hits 0, you take 40000 damage and deal 30 damage to all oponents.

var SLOW = "SLOW" #halves speed

var DRUNK = "DRUNK" #doubles ATTACK, tenths ACR, halves DEF, deals #DRUNK ^ 2 damage
