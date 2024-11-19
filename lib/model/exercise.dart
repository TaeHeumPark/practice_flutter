class Exercise {
  final int id;
  final String name;
  final String imagePath;
  final int durationInMinutes;
  final String audioName;
  final int kcal;

  Exercise({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.durationInMinutes,
    required this.audioName,
    required this.kcal,
  });
}

final List<Exercise> exercises = [
  Exercise(
    id: 1,
    name: '스쿼트',
    imagePath: 'assets/exercise/squat.jpeg',
    durationInMinutes: 30,
    audioName: 'audio/squat.mp3',
    kcal: 1,
  ),
  Exercise(
    id: 2,
    name: '사이드런지',
    imagePath: 'assets/exercise/side_lunge.jpeg',
    durationInMinutes: 20,
    audioName: 'audio/side_lunge.mp3',
    kcal: 1,
  ),
  Exercise(
    id: 3,
    name: '푸쉬업',
    imagePath: 'assets/exercise/pushup.jpeg',
    durationInMinutes: 15,
    audioName: 'audio/pushup.mp3',
    kcal: 1,
  ),
  Exercise(
    id: 4,
    name: '마운틴 클림버',
    imagePath: 'assets/exercise/mountain_climber.jpeg',
    durationInMinutes: 15,
    audioName: 'audio/mountain_climber.mp3',
    kcal: 1,
  ),
  Exercise(
    id: 5,
    name: '런지',
    imagePath: 'assets/exercise/lunge.jpeg',
    durationInMinutes: 20,
    audioName: 'audio/lunge.mp3',
    kcal: 1,
  ),
  Exercise(
    id: 6,
    name: '덤벨컬',
    imagePath: 'assets/exercise/dumbell_curl.jpeg',
    durationInMinutes: 40,
    audioName: 'audio/dumbell_curl.mp3',
    kcal: 1,
  ),
  Exercise(
    id: 7,
    name: '덩커킥',
    imagePath: 'assets/exercise/donkey_kick.jpeg',
    durationInMinutes: 30,
    audioName: 'audio/donkey_kick.mp3',
    kcal: 1,
  ),
  Exercise(
    id: 8,
    name: '친업',
    imagePath: 'assets/exercise/chinup.jpeg',
    durationInMinutes: 20,
    audioName: 'audio/chinup.mp3',
    kcal: 1,
  ),
  Exercise(
    id: 9,
    name: '벤치프레스',
    imagePath: 'assets/exercise/benchpress.jpeg',
    durationInMinutes: 10,
    audioName: 'audio/benchpress.mp3',
    kcal: 1,
  ),
];
