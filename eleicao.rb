require_relative 'processo_bully'
require_relative 'processo_ring'

puts "Informe o numero de processo:\n"
n = gets.chomp.to_i
raise ArgumentError, "Numero de processos deve ser >= 2" if n < 2

puts "Informe qual algoritmo de eleicao utilizar - (a)nel ou (b)ully:\n"
algoritmo = gets.chomp.downcase

if algoritmo == "a"
  processo = ProcessoRing.new n
elsif algoritmo == "b"
  processo = ProcessoBully.new n
else
  raise ArgumentError, "Algoritmo invalido!"
end

puts "Informe o PID do processo que inicia eleicao:\n"
processo.detecta_crash gets.chomp.to_i