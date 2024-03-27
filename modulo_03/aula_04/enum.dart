enum StatusPagamento {
  completo,
  processamento,
  pendente,
  cancelado,
  desconhecido;

  factory StatusPagamento.fromString(String value) {
    switch (value) {
      case 'completo':
        return StatusPagamento.completo;
      case 'processamento':
        return StatusPagamento.processamento;
      case 'pendente':
        return StatusPagamento.pendente;
      case 'cancelado':
        return StatusPagamento.cancelado;
      default:
        return StatusPagamento.desconhecido;
    }
  }
}

void main(){
  String statusPagamento = "";
  StatusPagamento status = StatusPagamento.fromString(statusPagamento);

  print(status.name);
}