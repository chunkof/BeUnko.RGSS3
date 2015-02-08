#==============================================================================
# �� DataManager
#------------------------------------------------------------------------------
# �@�f�[�^�x�[�X�ƃQ�[���I�u�W�F�N�g���Ǘ����郂�W���[���ł��B�Q�[���Ŏg�p����
# �قڑS�ẴO���[�o���ϐ��͂��̃��W���[���ŏ���������܂��B
#==============================================================================

module DataManager
  #--------------------------------------------------------------------------
  # �� �f�[�^���̕����񏑊�
  #--------------------------------------------------------------------------
  def self.rewrite_strings_to_unko(data)
    if data.nil? then
      return
    end
    if data.respond_to?(:name)          then data.name         = "����" end
    if data.respond_to?(:nickname)      then data.nickname     = "����" end
    if data.respond_to?(:message1)      then data.message1     = BeUnko::string(data.message1) end
    if data.respond_to?(:message2)      then data.message2     = BeUnko::string(data.message2) end
    if data.respond_to?(:message3)      then data.message3     = BeUnko::string(data.message3) end
    if data.respond_to?(:message4)      then data.message4     = BeUnko::string(data.message4) end
    if data.respond_to?(:description)   then data.description  = BeUnko::string(data.description) end
    data
  end
  #--------------------------------------------------------------------------
  # �� �f�[�^�x�[�X����
  #--------------------------------------------------------------------------
  def self.rewrite_database_to_unko()
    $data_system.game_title = "����"
    $data_system.skill_types.map!  {|type_name| type_name = "����"}
    $data_system.weapon_types.map! {|type_name| type_name = "����"}
    $data_system.armor_types.map!  {|type_name| type_name = "����"}
    $data_actors.map!      {|data| rewrite_strings_to_unko(data)}
    $data_classes.map!     {|data| rewrite_strings_to_unko(data)}
    $data_skills.map!      {|data| rewrite_strings_to_unko(data)}
    $data_items.map!       {|data| rewrite_strings_to_unko(data)}
    $data_weapons.map!     {|data| rewrite_strings_to_unko(data)}
    $data_armors.map!      {|data| rewrite_strings_to_unko(data)}
    $data_enemies.map!     {|data| rewrite_strings_to_unko(data)}
    $data_states.map!      {|data| rewrite_strings_to_unko(data)}
  end
  #--------------------------------------------------------------------------
  # �� �ʏ�̃f�[�^�x�[�X�����[�h
  #--------------------------------------------------------------------------
  class << self
    alias :beunko_datamanager_load_normal_database :load_normal_database unless method_defined?(:beunko_datamanager_load_normal_database)
  end
  def self.load_normal_database
    beunko_datamanager_load_normal_database()
    rewrite_database_to_unko()
  end
  #--------------------------------------------------------------------------
  # �� �퓬�e�X�g�p�̃f�[�^�x�[�X�����[�h
  #--------------------------------------------------------------------------
  class << self
    alias :beunko_datamanager_load_battle_test_database :load_battle_test_database unless method_defined?(:beunko_datamanager_load_battle_test_database)
  end
  def self.load_battle_test_database
    beunko_datamanager_load_battle_test_database
    rewrite_database_to_unko()
  end
end

