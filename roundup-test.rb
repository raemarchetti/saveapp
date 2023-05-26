def proximo_inteiro(valor)
  if valor.positive?
    prox_inteiro = valor.ceil
    valor_adicionado = prox_inteiro - valor
  elsif valor.negative?
    prox_inteiro = valor.floor
    valor_adicionado = valor - prox_inteiro
  else
    return [0, 1]
  end
  return [valor_adicionado.round(2), prox_inteiro]
end

