(window.btoa = (str) -> Base64.encode(str)) if (!window.btoa)
(window.atob = (str) -> Base64.decode(str)) if (!window.atob)

drum = angular.module('drum', ["mgcrea.ngStrap"])

drum.filter('range', ->
  (val, range) ->
    range = parseInt(range) - 1
    [0..range]
)

drum.filter('trackJson', ->
  (object) ->
    return '' unless object
    JSON.stringify(object)
)

instruments =
  kick: [0, 420]
  snare: [453, 434]
  clap: [11383, 157]
  cowbell: [908, 115]
  hiTom: [1360, 602]
  midTom: [1997, 851]
  lowTom: [2894, 839]
  hatOpen: [3756, 955]
  hatClosed: [4734, 130]
  ride: [4911, 962]
  tamb: [5878, 277]
  crash: [6830, 1267]
  splash: [8127, 843]
  china: [9578, 855]
  hiAgogo: [10591, 433]
  lowAgogo: [11095, 273]
  jytkyIl: [11625, 547]
  jytIl: [11625, 366]
  kyIl: [11990, 191]
  jytkyMas: [14235, 688]
  jytMas: [14235, 369]
  kyMas: [14604, 319]
  jytkytetään: [11625, 1430]
  tömähti: [13164, 1071]
  kahenKilon: [15056, 892]
  siika: [15948, 892]
  hallitus: [17935, 840]
  ha: [17935, 175]
  kolmen: [16901, 892]
  as: [17300, 366]

instrumentNames = Object.keys(instruments)

songs =
  "Californication - RHCP": {"tempo":190,"beatCount":8,"channels":{"snare":[0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,1],"kick":[1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1],"ride":[1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1],"crash":[1],"splash":[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0]}}

defaultTrack = {
  "tempo":134,
  "beatCount":8,
  "channels":{
    "snare":[],
    "clap": [0,0,1,0,0,0,1,1,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,0,0],
    "kick":[1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,0,1,0,0,1,1,1,1,1],
    "hatClosed":[],"hatOpen":[], "jytkyIl": [1,0,0,0,0,0,0,0,1], "jytIl": [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1],
    "kyIl": [], "jytkyMas": [], "jytMas": [], "kyMas": [],
    "jytkytetään": [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1],
    "tömähti": [],
    "kahenKilon": [],
    "siika": []
    "hallitus": []
    "ha": []
    "kolmen": []
    "as": []
  }
}