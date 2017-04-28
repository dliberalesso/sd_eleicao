require_relative 'processo'

class ProcessoBully < Processo
  def detecta_crash(pid)
    raise ArgumentError, "PID maior que a quantidade de processos criados!" if pid > @lista.size
    raise ArgumentError, "PID deve ser maior que 0!" if pid <= 0

    $coordenador = nil
    while $coordenador.nil? do
      if pid == @lista.last
        $coordenador = pid
      else
        maiores = @lista.select {|processo| processo > pid}

        maiores.each do |processo|
          puts "#{pid} -> #{processo}: ELECTION\n"
        end

        maiores.each do |processo|
          puts "#{processo} -> #{pid}: OK\n"
        end

        puts "---------------\n"

        pid += 1
      end
    end

    @lista.pop
    @lista.each do |processo|
      puts "#{$coordenador} -> #{processo}: COORDENADOR\n"
    end
  end
end