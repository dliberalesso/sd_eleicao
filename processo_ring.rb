require_relative 'processo'

class ProcessoRing < Processo
  def detecta_crash(pid)
    raise ArgumentError, "PID maior que a quantidade de processos criados!" if pid > @lista.size
    raise ArgumentError, "PID deve ser maior que 0!" if pid <= 0

    puts "RING\n"
  end
end