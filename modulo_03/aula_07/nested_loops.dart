void main(){
  int weeks = 4;
  int days = 7;

  List<String> weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  for(int i = 1; i <= weeks; i++){
    print('Week: $i');
    for(int d = 0; d < days; d++){
      print('  Day: ${d+1} (${weekDays[d]})');
    }
  }
}