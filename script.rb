module BeUnko
  #-------------------
  # Utility
  #-------------------
  def self.max_cyclic(org, max)
    return (org <= max) ? org : 0
  end
  def self.max_stop(org, max)
    return (org <= max) ? org : max
  end
  #-------------------
  # module_function(s)
  #-------------------
  module_function
  #
  # convert string
  #
  def string(org)
    serial = 0;
    last_type = '-'
    result = ""
    # convert
    org.split(//).each{|ch|
      # �Ђ炪��
      if    /\p{Hiragana}/ =~ ch then
        # ����������
        if /[�����������������]/ =~ ch then
          replace = ['��','��','��']
          serial = ('hira'==last_type) ? serial : 0;
        # �i�~��
        else
          replace = ['��','��','��']
          serial = ('hira'==last_type) ? max_cyclic(serial+1,replace.length-1) : 0;
        end
        ch = replace[serial]
        last_type = 'hira'
      # �J�^�J�i
      elsif /\p{Katakana}/ =~ ch then
        # ����������
        if /[�@�B�D�F�H�����b��������]/ =~ ch then
          replace = ['�D','�b','�H']
          serial = ('kata'==last_type) ? serial : 0;
        # ����������(���p)
        elsif /[���������������]/ =~ ch then
          replace = ['�','�','�']
          serial = ('kata'==last_type) ? serial : 0;
        # �i�~��(���p)
        elsif /[�-�]/ =~ ch then
          replace = ['�','�','�']
          serial = ('kata'==last_type) ? max_cyclic(serial+1,replace.length-1) : 0;
        # �i�~��
        else
          replace = ['�E','��','�R']
          serial = ('kata'==last_type) ? max_cyclic(serial+1,replace.length-1) : 0;
        end
        ch = replace[serial]
        last_type = 'kata'
      # ����
      elsif /[��-ꞁX]/ =~ ch then
        ch = '��'
        last_type = 'kanji'
      # �A���t�@�x�b�g
      elsif /[a-zA-Z]/ =~ ch then
        # ������
        if /[a-z]/ =~ ch then
          replace = ['u','n','k','o']
        # �啶��
        else
          replace = ['U','N','K','O']
        end
        serial = ('alpha'==last_type) ? max_stop(serial+1,replace.length-1) : 0;
        ch = replace[serial]
        last_type = 'alpha'
      # �p��
      elsif /[�[�\�`�E]/ =~ ch then
        # last_type�X�V���Ȃ�
      # ���̑�
      else
        last_type = '-'
      end
      
      result = result + ch.to_s
    }
    
    return result
  end
end


#==============================================================================
# �� Vocab
#------------------------------------------------------------------------------
# �@�p��ƃ��b�Z�[�W���`���郂�W���[���ł��B�萔�Ń��b�Z�[�W�Ȃǂ𒼐ڒ�`��
# ��ق��A�O���[�o���ϐ� $data_system ����p��f�[�^���擾���܂��B
#==============================================================================

module Vocab

  # �V���b�v���
  ShopBuy         = "����"
  ShopSell        = "����"
  ShopCancel      = "����"
  Possession      = "���[��"

  # �X�e�[�^�X���
  ExpTotal        = "����[��"
  ExpNext         = "���� %s"

  # �Z�[�u�^���[�h���
  SaveMessage     = "���񂱂��񂱃E�[���R�H"
  LoadMessage     = "���񂱂��񂱃E�[���R�H"
  File            = "����"

  # ���������o�[�̏ꍇ�̕\��
  PartyName       = "%s"

  # �퓬��{���b�Z�[�W
  Emerge          = "%s���񂱁I"
  Preemptive      = "%s���񂱂Ղ���ƁI"
  Surprise        = "%s���񂱂����񂱁I"
  EscapeStart     = "%s���񂱂��񂱁I"
  EscapeFailure   = "���񂱂��I"

  # �퓬�I�����b�Z�[�W
  Victory         = "%s �Ղ������[��I"
  Defeat          = "%s���񂱂��E�E�E"
  ObtainExp       = "%s ���񂱂��������񂱁I"
  ObtainGold      = "�� %s\\unko ���񂱁I"
  ObtainItem      = "%s����҂��ҁI"
  LevelUp         = "%s %s ���񂿂��I %s ���񂿂��I"
  ObtainSkill     = "�Ԃ���� %s"

  # �A�C�e���g�p
  UseItem         = "%s %s���񂱁I"

  # �N���e�B�J���q�b�g
  CriticalToEnemy = "���񂱂������I�I"
  CriticalToActor = "���[�񂱂����I�I"

  # �A�N�^�[�Ώۂ̍s������
  ActorDamage     = "%s %s �E���[�R���񂱁I"
  ActorRecovery   = "%s %s�� %s ���񂱂��I"
  ActorGain       = "%s %s�� %s ���񂿂��I"
  ActorLoss       = "%s %s�� %s ���񂿂��I"
  ActorDrain      = "%s %s�� %s ���������I"
  ActorNoDamage   = "%s �E���[�R���񂱂����I"
  ActorNoHit      = "�Ղ�I�@%s �E���[�R���񂱂����I"

  # �G�L�����Ώۂ̍s������
  EnemyDamage     = "%s %s ���񂱂��I"
  EnemyRecovery   = "%s %s  %s ���񂱂��I"
  EnemyGain       = "%s %s  %s ����҂��I"
  EnemyLoss       = "%s %s  %s ����҂��I"
  EnemyDrain      = "%s %s  %s ��������I"
  EnemyNoDamage   = "%s �E���[�R���������񂱂��I"
  EnemyNoHit      = "�v���I�@%s �E���[�R�������񂱂��I"

  # ����^����
  Evasion         = "%s���񂱂�������I"
  MagicEvasion    = "%s���񂱂���[���I"
  MagicReflection = "%s���񂱂ۂ������I"
  CounterAttack   = "%s���񂱂��I"
  Substitute      = "%s %s���񂱂����I"

  # �\�͋����^���
  BuffAdd         = "%s %s���񂿂��I"
  DebuffAdd       = "%s %s���񂿂��I"
  BuffRemove      = "%s %s���񂱂�������I"

  # �X�L���A�A�C�e���̌��ʂ��Ȃ�����
  ActionFailure   = "%s���������񂱁I"

  # �G���[���b�Z�[�W
  PlayerPosError  = "�v���C���[�̂��񂱂��ݒ肳��Ă��܂���B"
  EventOverflow   = "�R�������񂱂̌Ăяo��������𒴂��܂����B"

  # ��{�X�e�[�^�X
  def self.basic(basic_id)
    "����"
  end

  # �\�͒l
  def self.param(param_id)
    "����"
  end

  # �����^�C�v
  def self.etype(etype_id)
    "����"
  end

  # �R�}���h
  def self.command(command_id)
    "����"
  end

  # �ʉݒP��
  def self.currency_unit
    "����"
  end

  #--------------------------------------------------------------------------
  def self.level;       "�E���R";     end   # ���x��
  def self.level_a;     "�ݺ";        end   # ���x�� (�Z)
  def self.hp;          "Unko";       end   # HP
  def self.hp_a;        "unko";       end   # HP (�Z)
  def self.mp;          "Unko";       end   # MP
  def self.mp_a;        "unko";       end   # MP (�Z)
  def self.tp;          "Unko";       end   # TP
  def self.tp_a;        "unko";       end   # TP (�Z)
  #--------------------------------------------------------------------------
end
#==============================================================================
# �� DataManager
#------------------------------------------------------------------------------
# �@�f�[�^�x�[�X�ƃQ�[���I�u�W�F�N�g���Ǘ����郂�W���[���ł��B�Q�[���Ŏg�p����
# �قڑS�ẴO���[�o���ϐ��͂��̃��W���[���ŏ���������܂��B
#==============================================================================

module DataManager
  #--------------------------------------------------------------------------
  # �� �ʏ�̃f�[�^�x�[�X�����[�h
  #--------------------------------------------------------------------------
  def self.rename_to_unko(data)
    if data.nil? then
      return
    end
    if data.respond_to?(:name)         then data.name        = "����" end
    if data.respond_to?(:nickname)     then data.nickname    = "����" end
    data
  end
  class << self
    alias :beunko_datamanager_load_normal_database :load_normal_database unless method_defined?(:beunko_datamanager_load_normal_database)
  end
  def self.load_normal_database
    beunko_datamanager_load_normal_database()
    $data_actors.map!  {|data| rename_to_unko(data)}
    $data_classes.map! {|data| rename_to_unko(data)}

  end
  #--------------------------------------------------------------------------
  # �� �퓬�e�X�g�p�̃f�[�^�x�[�X�����[�h
  #--------------------------------------------------------------------------
  def self.load_battle_test_database
    $data_actors        = load_data("Data/BT_Actors.rvdata2")
    $data_classes       = load_data("Data/BT_Classes.rvdata2")
    $data_skills        = load_data("Data/BT_Skills.rvdata2")
    $data_items         = load_data("Data/BT_Items.rvdata2")
    $data_weapons       = load_data("Data/BT_Weapons.rvdata2")
    $data_armors        = load_data("Data/BT_Armors.rvdata2")
    $data_enemies       = load_data("Data/BT_Enemies.rvdata2")
    $data_states        = load_data("Data/BT_States.rvdata2")
  end
end

#==============================================================================
# �� Game_Actor
#------------------------------------------------------------------------------
# �@�A�N�^�[�������N���X�ł��B���̃N���X�� Game_Actors �N���X�i$game_actors�j
# �̓����Ŏg�p����AGame_Party �N���X�i$game_party�j������Q�Ƃ���܂��B
#==============================================================================
class Game_Actor < Game_Battler
  #--------------------------------------------------------------------------
  # �� �Z�b�g�A�b�v
  #--------------------------------------------------------------------------
  alias beunko_game_actor_setup setup
  def setup(actor_id)
    beunko_game_actor_setup(actor_id)
    @name = "����"
    @nickname = "����"
  end
end

#==============================================================================
# �� Game_Enemy
#------------------------------------------------------------------------------
# �@�G�L�����������N���X�ł��B���̃N���X�� Game_Troop �N���X�i$game_troop�j��
# �����Ŏg�p����܂��B
#==============================================================================
class Game_Enemy < Game_Battler
  #--------------------------------------------------------------------------
  # �� �I�u�W�F�N�g������
  #--------------------------------------------------------------------------
  alias beunko_game_enemy_initialize initialize
  def initialize(index, enemy_id)
    beunko_game_enemy_initialize(index, enemy_id)
    @original_name = "����"
  end
end

#==============================================================================
# �� Game_Troop
#------------------------------------------------------------------------------
# �@�G�O���[�v����ѐ퓬�Ɋւ���f�[�^�������N���X�ł��B�o�g���C�x���g�̏�����
# �s���܂��B���̃N���X�̃C���X�^���X�� $game_troop �ŎQ�Ƃ���܂��B
#==============================================================================
class Game_Troop < Game_Unit
  #--------------------------------------------------------------------------
  # �� �G�L�������̌��ɂ��镶���̕\
  #--------------------------------------------------------------------------
  LETTER_TABLE_HALF = [' U',' N',' K',' O',' B',' U',' R',' I']
  LETTER_TABLE_FULL = ['�t','�m','�j','�n','�a','�t','�q','�h']
end
#==============================================================================
# �� Window_Base
#------------------------------------------------------------------------------
# �@�Q�[�����̑S�ẴE�B���h�E�̃X�[�p�[�N���X�ł��B
#==============================================================================

class Window_Base < Window
  #--------------------------------------------------------------------------
  # �� ���䕶���̎��O�ϊ�
  #    ���ۂ̕`����n�߂�O�ɁA�����Ƃ��ĕ�����ɕς����̂�����u��������B
  #    �����u\�v�̓G�X�P�[�v�����i\e�j�ɕϊ��B
  #--------------------------------------------------------------------------
  alias beunko_window_base_convert_escape_characters convert_escape_characters
  def convert_escape_characters(text)
    result = BeUnko::string(text.to_s)
    result = beunko_window_base_convert_escape_characters(result)
    result
  end
end

#==============================================================================
# �� Window_MapName
#------------------------------------------------------------------------------
# �@�}�b�v����\������E�B���h�E�ł��B
#==============================================================================

class Window_MapName < Window_Base
  #--------------------------------------------------------------------------
  # �� ���t���b�V��
  #--------------------------------------------------------------------------
  def refresh
    contents.clear
    unless $game_map.display_name.empty?
      draw_background(contents.rect)
      draw_text(contents.rect, BeUnko::string($game_map.display_name), 1)
    end
  end
end
