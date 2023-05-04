Minim minim;

AudioPlayer backgroundplayer;
AudioPlayer playershooting;
AudioPlayer playershooted;
AudioPlayer startsound;
AudioPlayer endsound;


boolean audioplayershoot = false;
boolean audioshooted = false;

HashMap<String,AudioPlayer> players = new HashMap<>();

  //upload audio
void uploadAudio(){
    minim = new Minim(this);
    backgroundplayer = minim.loadFile("audio"+File.separator+"backgroundAudio.mp3");
    playershooting = minim.loadFile("audio"+File.separator+ "shootingAudio"+ File.separator+"player2shoot.mp3");
    playershooted = minim.loadFile("audio"+File.separator+ "shootedAudio"+ File.separator+"hit-someting.mp3");
    players.put("playershooting",playershooting);
    players.put("playershooted",playershooted);
    players.put("backgroundplayer",backgroundplayer);
    startsound = minim.loadFile("audio"+File.separator+"start.mp3");
    endsound = minim.loadFile("audio"+File.separator+"end.mp3");
  }
  
  //display fighting background music
  void playbackground(){
      backgroundplayer.play();
  }
  
    //stop fighting background music
  void playbackgroundstop(){
      backgroundplayer.pause();
       backgroundplayer.rewind();
  }
  
  //display shooting music
  void playershooting(){
      playershooting.play();
  }
  
  //stop shooting music
  void playershootingstop(){
       playershooting.pause();
       playershooting.rewind();
  }
  
  //display be shooted music
  void playershooted(){
      playershooted.play();
  }
  
  //stop be shooted music
  void playershootedstop(){
    playershooted.pause();
    playershooted.cue(0);
  }
  
  void fightingAudio(){
  //Play fighting audio
    for(String audioName : players.keySet()){
        if(audioName.equals("backgroundplayer")){
            playbackground();
          }
        if(audioName.equals("playershooting")){
            if(audioplayershoot == true){
                playershooting();
            }
            else{
                playershootingstop();
            }
         }
        if(audioName.equals("playershooted")){
            if(audioshooted == true){
                playershooted();
            }
            else{
                playershootedstop();
            }
        }
        
    }
  }
  
