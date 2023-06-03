class StatusInterpreter{
  static String getStatus(String oldStatus){
    switch(oldStatus){
      case 'Finished':
      case 'finished_airing':
      case 'Finished Airing':
        return 'Finalizado';
      case 'Publishing':
      case 'currently_airing':
      case 'Currently Airing':
        return 'Em exibição';
      case 'On Hiatus':
        return 'Em hiato';
      case 'Discontinued':
        return 'Descontinuado';
      default:
        return 'Ainda não foi exibido';
    }
  }
}