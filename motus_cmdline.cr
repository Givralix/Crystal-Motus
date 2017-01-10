require "colorize"

f = File.read_lines("8lettres.txt")
mot = f[rand(f.size)]

indice = ""
a = 0
# l'emplacement du 2ème indice
nombre = rand(mot.size-1) + 1
while a < mot.size-1
	if a == 0 || a == nombre
		indice = "#{indice}#{mot[a]}"
	else
		indice = "#{indice}."
	end
	a = a + 1
end

puts "Vous avez 6 essais pour trouver le mot. Voici un indice :"
puts indice

essai = 0
lettres_trouvées = Array.new(mot.size, "lo")

while essai < 6
	puts "\nEssai N°#{essai+1} :"
	proposition = "#{STDIN.gets}"
	if proposition.size != mot.size
		puts "Votre proposition est de la mauvaise longueur, recommencez."
		next
	end

	if proposition == mot
		puts "Bravo ! Vous avez trouvé le mot en #{essai+1} essai(s) !"
		break
	end

	a = 0
	indice = ""
	while a < mot.size
		if a == 0 || a == nombre || proposition[a] == mot[a]
			indice = "#{indice}#{mot[a].colorize(:red)}"
			lettres_trouvées[a] = ""
			lettres_trouvées[a] = "#{mot[a]}"
		elsif lettres_trouvées[a] != "lo"
			indice = "#{indice}#{lettres_trouvées[a].colorize(:red)}"
		elsif mot.includes?(proposition[a])
			indice = "#{indice}#{proposition[a].colorize(:yellow)}"
		else
			indice = "#{indice}#{proposition[a]}"
		end
		a = a + 1
	end

	puts indice
	essai = essai + 1
end

