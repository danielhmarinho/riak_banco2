# Encoding: utf-8

require 'riak'
require 'pp'

#setting riak client
client = Riak::Client.new(:pb_port => 8087)

#data
hospitais = [{
  id_hospital: '1' ,
  descricao: 'Hospital 1' ,
  endereco: {
    logradouro: 'Avenida 3' ,
    numero: '4',
    cep: '12114530',
    cidade: 'Brasília',
    estado: 'DF'
  }},
  {
  id_hospital: '2' ,
  descricao: 'Hospital 2' ,
  endereco: {
    logradouro: 'Avenida 4' ,
    numero: '1',
    cep: '12334530',
    cidade: 'Brasília',
    estado: 'DF'
}}]

enfermarias = [{
  id_hospital: '2' ,
  id_enfermaria: '1',
  descricao: 'pediatria' ,
  ala: 'centro'
},
{
  id_hospital: '2' ,
  id_enfermaria: '1',
  descricao: 'raio x' ,
  ala: 'sul'
},
{
  id_hospital: '1' ,
  id_enfermaria: '1',
  descricao: 'emergencia' ,
  ala: 'norte'
  }]

pacientes = [{
  id_enfermaria: '1',
  id_paciente: '1',
  nome: 'Alan',
  endereco: {
    logradouro: 'Avenida g bloco 3',
    numero: '2',
    cep: '4584562' ,
    cidade: 'Brasilia',
    estado: 'DF'
  },
  sexo: 'M',
  telefone: '213124',
  email: 'alan@gmail.com',
  plano_de_saude: 'BRB' ,
  data_nasc: '19/02/1474'
},
{
  id_enfermaria: '1',
  id_paciente: '2',
  nome: 'Marta',
  endereco: {
    logradouro: 'Avenida g bloco 2',
    numero: '10',
    cep: '5478878' ,
    cidade: 'Brasilia',
    estado: 'DF'
  },
  sexo: 'F',
  telefone: '762763287',
  email: 'marta@glulmail.com',
  plano_de_saude: 'BB' ,
  data_nasc: '21/03/1978'
}]

enfermeiros = [{
  id_enfermaria: 1 ,
  id_enfermeiro: 1,
  nome: 'Pedro',
  sexo: 'M',
  telefone: '87787855',
  endereco: {
    logradouro: 'RUA 3',
    numero: '2',
    cep: '74718521' ,
    cidade: 'Brasília',
    estado: 'DF'
  },
  formacao: 'assistente',
  coren: '3984737843'
},
{
id_enfermaria: '1' ,
id_enfermeiro: '2',
nome: 'Maria',
sexo: 'F',
telefone: '843487855',
endereco: {
  logradouro: 'RUA 2',
  numero: '1',
  cep: '5428521' ,
  cidade: 'Brasília',
  estado: 'DF'
},
formacao: 'assistente',
coren: '1222337843'
}]

convenios = [{
  id_hospital: '1' ,
  id_laboratorio: '1' ,
  id_convenio: '1',
  descricao: 'BRB',
  valor: 'R$ 23343,00' ,
  tipo: 'Idoso'
},
{
  id_hospital: '1' ,
  id_laboratorio: '2' ,
  id_convenio: '2',
  descricao: 'BB',
  valor: 'R$ 32343,00' ,
  tipo: 'Jovem'
},
{
  id_hospital: '2' ,
  id_laboratorio: '3' ,
  id_convenio: '3',
  descricao: 'Caixa',
  valor: 'R$ 19343,00' ,
  tipo: 'Jovem'
}
]

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

medicos = [{
  crm: '2131231',
  hospitais: [1],
  nome: 'Alberto',
  sexo: 'M',
  estado_civil: 'Solteiro',
  endereco: {
    logradouro: 'RUA 7',
    numero: '3',
    cep: '144846',
    cidade: 'Brasilia',
    estado: 'DF'
  },
  telefone:  '8787542121',
  titulacao: 'Doutor',
  filiacao: {
    pai: 'João',
    mae: 'Maria'
  },
  email: 'medico1@gmail.com'
},
{
  crm: '1425147',
  hospitais: [1],
  nome: 'Simas',
  sexo: 'M',
  estado_civil: 'Casado',
  endereco: {
    logradouro: 'RUA 2',
    numero: '3',
    cep: '14434846',
    cidade: 'Brasilia',
    estado: 'DF'
  },
  telefone:  '666756621',
  titulacao: 'Doutor',
  filiacao: {
    pai: 'João',
    mae: 'Maria'
  },
  email: 'medico2@gmail.com'
}]

exames = [{
  id_exame: '1',
  descricao: 'Exame de sangue',
  restricao: 'Nenhuma',
  id_paciente: '1',
  crm: '1425147',
  id_laboratorio: '1',
  status: 'Pronto'
},
{
  id_exame: '1',
  descricao: 'Exame de urina',
  restricao: 'Nenhuma',
  id_paciente: '1',
  crm: '1425147',
  id_laboratorio: '2',
  status: 'Em andamento'
}
]

consulta = {
  id_consulta: '',
  id_paciente: '',
  crm: ''
}

#relations
funcionarios_hospital = {
  id_hospital: 1,
  funcionarios_hospital: [
  {
    id_enfermeiro: 1,
    nome: 'Pedro',
    sexo: 'M',
    telefone: '87787855'
  },
  {
    id_enfermeiro: '2',
    nome: 'Maria',
    sexo: 'F',
    telefone: '843487855'
  },
  {
    crm: '2131231',
    hospitais: [1],
    nome: 'Alberto',
    sexo: 'M'
  },
  {
    crm: '1425147',
    hospitais: [1],
    nome: 'Simas',
    sexo: 'M',
  }]
}

convenios_hosp = {
  id_hospital: 1,
  relatorio: [{
    id_laboratorio: '1' ,
    id_convenio: '1',
    descricao: 'BRB',
    valor: 'R$ 23343,00' ,
    tipo: 'Idoso'
  },
  {
    id_laboratorio: '2' ,
    id_convenio: '2',
    descricao: 'BB',
    valor: 'R$ 32343,00' ,
    tipo: 'Jovem'
  }]
}

crmpac = {
  crm: '1425147',
  pacientes: [
    {
      id_paciente: '1',
      nome: 'Alan',
      endereco: {
        logradouro: 'Avenida g bloco 3',
        numero: '2',
        cep: '4584562' ,
        cidade: 'Brasilia',
        estado: 'DF'
      },
      sexo: 'M'
    },
    {
      id_paciente: '2',
      nome: 'Marta',
      endereco: {
        logradouro: 'Avenida g bloco 2',
        numero: '10',
        cep: '5478878' ,
        cidade: 'Brasilia',
        estado: 'DF'
      },
      sexo: 'F'
    }
  ]
}

exam = {
  id_paciente: '1',
  register: [
    {
      id_exame: '1',
      descricao: 'Exame de sangue',
      restricao: 'Nenhuma',
      crm: '1425147',
      id_laboratorio: '1',
      status: 'Pronto'
    },
    {
      id_exame: '1',
      descricao: 'Exame de urina',
      restricao: 'Nenhuma',
      crm: '1425147',
      id_laboratorio: '2',
      status: 'Em andamento'
    }
  ]
}

#creating buckets and store data
hospital_bucket = client.bucket('Hospitais')
hospitais.each do |hospital|
  hospital_riak = hospital_bucket.new(hospital[:id_hospital].to_s)
  hospital_riak.data = hospital
  hospital_riak.store
end

enfermaria_bucket = client.bucket('Enfermarias')
enfermarias.each do |enfermaria|
  enfermaria_riak = enfermaria_bucket.new(enfermaria[:id_enfermaria].to_s)
  enfermaria_riak.data = enfermaria
  enfermaria_riak.store
end

enfermeiro_bucket = client.bucket('Enfermeiros')
enfermeiros.each do |enfermeiro|
  enfermeiro_riak = enfermeiro_bucket.new(enfermeiro[:id_enfermeiro].to_s)
  enfermeiro_riak.data = enfermeiro
  enfermeiro_riak.store
end

medico_bucket = client.bucket('Medicos')
medicos.each do |medico|
  medico_riak = medico_bucket.new(medico[:crm].to_s)
  medico_riak.data = medico
  medico_riak.store
end

convenio_bucket = client.bucket('Convenios')
convenios.each do |convenio|
  convenio_riak = convenio_bucket.new(convenio[:id_convenio].to_s)
  convenio_riak.data = convenio
  convenio_riak.store
end

paciente_bucket = client.bucket('Pacientes')
pacientes.each do |paciente|
  paciente_riak = paciente_bucket.new(paciente[:id_paciente].to_s)
  paciente_riak.data = paciente
  paciente_riak.store
end

exame_bucket = client.bucket('Exames')
exames.each do |exame|
  exame_riak = exame_bucket.new(exame[:id_exame].to_s)
  exame_riak.data = exame
  exame_riak.store
end

#relation hospital and employee
funcionarios_hospital_bucket = client.bucket('Funcionarios')
fn = funcionarios_hospital_bucket.new(funcionarios_hospital[:id_hospital].to_s)
fn.data = funcionarios_hospital
fn.store

func = '1'
hospital = hospital_bucket.get(func).data
hospital[:funcionarios] = funcionarios_hospital_bucket.get(func).data
puts "Relação de enfermeiros e médicos do hospital: "
pp hospital
puts ''

#relation hospital and covenant
convenios_hosp_bucket = client.bucket('ConvHosp')
ch = convenios_hosp_bucket.new(convenios_hosp[:id_hospital].to_s)
ch.data = convenios_hosp
ch.store

conv = '1'
convs = hospital_bucket.get(conv).data
convs[:convenios] = convenios_hosp_bucket.get(conv).data
puts "Relação de convênios do hospital: "
pp convs
puts ''

#relation patient and medic
crmpac_bucket = client.bucket('crmPac')
pm = crmpac_bucket.new(crmpac[:crm].to_s)
pm.data = crmpac
pm.store

med = '1425147'
meds = medico_bucket.get(med).data
meds[:pacientes] = crmpac_bucket.get(med).data
puts "Relação de pacientes por médico: "
pp meds
puts ''

#relation exam and patient
exam_bucket = client.bucket('Exams')
ex = exam_bucket.new(exam[:id_paciente].to_s)
ex.data = exam
ex.store

pac = '1'
pacs = paciente_bucket.get(pac).data
pacs[:exams] = exam_bucket.get(pac).data
puts "Relação de exames do paciente 1: "
pp pacs
puts ''
