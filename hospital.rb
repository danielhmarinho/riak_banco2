require 'riak'
require 'pp'

#setting riak client
client = Riak::Client.new(:pb_port => 8087)

#data
hospital = [{
  id_hospital: '' ,
  descricao: '' ,
  endereco: {
    logradouro: '' ,
    numero: '',
    cep: '',
    cidade: '',
    estado: ''
  }
}]

enfermaria = [{
  id_hospital: '' ,
  id_enfermaria: '',
  descricao: '' ,
  ala: ''
}]

paciente = [{
  id_enfermaria: '',
  id_paciente: '',
  nome: '',
  endereco: {
    logradouro: '',
    numero: '',
    cep: '' ,
    cidade: '',
    estado: ''
  },
  sexo: '',
  telefone: '',
  email: '',
  plano_de_saude: '' ,
  data_nasc: ''
}]

enfermeiro = {
  id_enfermaria: '' ,
  id_enfermeiro: '',
  nome: '',
  sexo: '',
  telefone: '',
  endereco: {
    logradouro: '',
    numero: '',
    cep: '' ,
    cidade: '',
    estado: ''
  },
  formacao: '',
  coren: ''
}

convenio = {
  id_hospital: '' ,
  id_laboratorio: '' ,
  id_convenio: '',
  descricao: '',
  valor: '' ,
  tipo: ''
}

laboratorio = {
  id_laboratorio: '' ,
  descricao: '',
  endereco: {
    logradouro: '',
    numero: '',
    cep: '',
    cidade: '',
    estado: ''
  },
  telefone: ''
}

equipamento = {
  id_enfermaria: '' ,
  id_equipamento: '',
  descricao: '',
  fabricante: ''
}

medico = {
  crm: '',
  hospitais: [],
  nome: '',
  sexo: '',
  estado_civil: '',
  endereco: {
    logradouro: '',
    numero: '',
    cep: '',
    cidade: '',
    estado: ''
  },
  telefone:  '',
  titulacao: '',
  filiacao: {
    pai: '',
    mae: ''
  },
  email: ''
}

exame = {
  id_exame: '',
  descricao: '',
  restricao: '',
  id_paciente: '',
  crm: '',
  id_laboratorio: '',
  status: ''
}

consulta = {
  id_consulta: '',
  id_paciente: '',
  crm: ''
}

#creating buckets and store data
hospital_bucket = client.bucket('Hospitais')
hospitais.each do |hospital|
  hospital_riak = hospital.bucket.new(hospital[:id_hospital].to_s)
  hospital_riak.data = hospital
  hospital_riak.store
end

enfermaria_bucket = client.bucket('Enfermarias')
enferamarias.each do |enfermaria|
  enfermaria_riak = enfermaria.bucket.new(enfermaria[:id_enfermaria].to_s)
  enfermaria_riak.data = enfermaria
  enfermaria_riak.store
end

paciente_bucket = client.bucket('Pacientes')
pacientes.each do |paciente|
  paciente_riak = paciente.bucket.new(paciente[:id_paciente].to_s)
  paciente_riak.data = paciente
  paciente_riak.store
end

enfermeiro_bucket = client.bucket('Enfermeiros')
enfermeiros.each do |enfermeiro|
  enfermeiro_riak = enfermeiro.bucket.new(enfermeiro[:id_enfermeiro].to_s)
  enfermeiro_riak.data = enfermeiro
  enfermeiro_riak.store
end
