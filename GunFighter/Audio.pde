Minim minim;

AudioPlayer backgroundplayer;
AudioPlayer playershooting;
AudioPlayer playershooted;
AudioPlayer startsound;
AudioPlayer endsound;


boolean audioplayershoot = false;
boolean audioshooted = false;

HashMap<String,AudioPlayer> players = new HashMap<>();

  
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
  void playbackground(){
      backgroundplayer.play();
  }
  void playbackgroundstop(){
      backgroundplayer.pause();
       backgroundplayer.rewind();
  }
  void playershooting(){
      playershooting.play();
  }
  void playershootingstop(){
       playershooting.pause();
       playershooting.rewind();
  }
  void playershooted(){
      playershooted.play();
  }
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
  
