class StatusInterpreter{
  static String interpretStatus(String oldStatus){
    switch(oldStatus){
      case 'finished_airing':
        return 'Finalizado';
      case 'currently_airing':
        return 'Em exibição';
      default:
        return 'Ainda não foi exibido';
    }
  }
}