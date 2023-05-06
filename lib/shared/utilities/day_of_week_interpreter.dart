class DayOfWeekInterpreter{
  static String getNameOfWeekDay(String weekday){
    switch (weekday){
      case 'Monday':
        return 'Segunda';
      case 'tuesday':
        return 'Terça';
      case 'wednesday':
        return 'Quarta';
      case 'thursday':
        return 'Quinta';
      case 'friday':
        return 'Sexta';
      case 'saturday':
        return 'Sábado';
      default:
        return 'Domingo';
    }
  }
}