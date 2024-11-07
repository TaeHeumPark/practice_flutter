class Exercise {
  final String name;
  final String imagePath;
  final int durationInMinutes;

  Exercise({
    required this.name,
    required this.imagePath,
    required this.durationInMinutes,
  });
}

final List<Exercise> exercises = [
  Exercise(
    name: '스쿼트',
    imagePath: 'assets/exercise/squat.jpeg',
    durationInMinutes: 30,
  ),
  Exercise(
    name: '사이드런지',
    imagePath: 'assets/exercise/side_lunge.jpeg',
    durationInMinutes: 20,
  ),
  Exercise(
    name: '푸쉬업',
    imagePath: 'assets/exercise/pushup.jpeg',
    durationInMinutes: 15,
  ),
  Exercise(
    name: '마운틴 클림버',
    imagePath: 'assets/exercise/mountain_climber.jpeg',
    durationInMinutes: 15,
  ),
  Exercise(
    name: '런지',
    imagePath: 'assets/exercise/lunge.jpeg',
    durationInMinutes: 20,
  ),
  Exercise(
    name: '덤벨컬',
    imagePath: 'assets/exercise/dumbell_curl.jpeg',
    durationInMinutes: 40,
  ),
  Exercise(
    name: '덩커킥',
    imagePath: 'assets/exercise/donkey_kick.jpeg',
    durationInMinutes: 30,
  ),
  Exercise(
    name: '친업',
    imagePath: 'assets/exercise/chinup.jpeg',
    durationInMinutes: 20,
  ),
  Exercise(
    name: '벤치프레스',
    imagePath: 'assets/exercise/benchpress.jpeg',
    durationInMinutes: 10,
  ),
];
