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
