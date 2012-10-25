class Entidade < ActiveRecord::Base
  attr_accessible :apoio_estadual_ent, :apoio_federal_ent, :apoio_municipal_ent, :apoio_particular_ent, :aprovado_ent, :atuacao_administrativa_ent, :atuacao_doacao_ent, :atuacao_educacao_ent, :atuacao_juridica_ent, :atuacao_manutencao_ent, :atuacao_outro_ent, :atuacao_recreacao_ent, :atuacao_saude_ent, :cnpj_ent, :data_fundacao_ent, :email_ent, :endereco_ent, :horarios_atendimento_ent, :nome_ent, :nome_responsavel_ent, :numero_beneficiados_ent, :publico_adolescentes_ent, :publico_adultos_ent, :publico_criancas_ent, :publico_especiais_ent, :publico_melhor_idade_ent, :publico_outros_ent, :site_ent, :telefone_ent, :visualizado_ent

  usar_como_cnpj :cnpj_ent

validates  :cnpj_ent, :uniqueness => true 
validates  :nome_ent, :presence => true                  
validates  :endereco_ent, :presence => true
validates  :nome_responsavel_ent, :presence => true      
validates  :email_ent, :uniqueness => true                 
validates  :telefone_ent, :presence => true              
/#
validates  :site_ent                  
validates  :data_fundacao_ent         
validates  :publico_criancas_ent      
validates  :publico_adultos_ent       
validates  :publico_melhor_idade_ent  
validates  :publico_adolescentes_ent  
validates  :publico_especiais_ent     
validates  :publico_outros_ent        
validates  :numero_beneficiados_ent   
validates  :atuacao_juridica_ent      
validates  :atuacao_administrativa_ent
validates  :atuacao_recreacao_ent     
validates  :atuacao_saude_ent         
validates  :atuacao_educacao_ent      
validates  :atuacao_manutencao_ent    
validates  :atuacao_doacao_ent        
validates  :atuacao_outro_ent         
validates  :apoio_municipal_ent       
validates  :apoio_estadual_ent        
validates  :apoio_federal_ent         
validates  :apoio_particular_ent      
validates  :horarios_atendimento_ent  
validates  :visualizado_ent           
validates  :aprovado_ent              
#/

  has_many :historicos

end
