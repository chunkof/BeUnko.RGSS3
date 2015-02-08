# coding: utf-8

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
    if false == org.kind_of?(String) then
      return org
    end
    serial = 0;
    last_type = '-'
    result = ""
    # convert
    org.split(//).each{|ch|
      # ‚Ð‚ç‚ª‚È
      if    /\p{Hiragana}/ =~ ch then
        # ¬‘‚«•¶Žš
        if /[‚Ÿ‚¡‚£‚¥‚§‚Á‚á‚ã‚å‚ì]/ =~ ch then
          replace = ['‚£','‚Á','‚§']
          serial = ('hira'==last_type) ? serial : 0;
        # ƒiƒ~Žš
        else
          replace = ['‚¤','‚ñ','‚±']
          serial = ('hira'==last_type) ? max_cyclic(serial+1,replace.length-1) : 0;
        end
        ch = replace[serial]
        last_type = 'hira'
      # ƒJƒ^ƒJƒi
      elsif /\p{Katakana}/ =~ ch then
        # ¬‘‚«•¶Žš
        if /[ƒ@ƒBƒDƒFƒHƒ•ƒ–ƒbƒƒƒ…ƒ‡ƒŽ]/ =~ ch then
          replace = ['ƒD','ƒb','ƒH']
          serial = ('kata'==last_type) ? serial : 0;
        # ¬‘‚«•¶Žš(”¼Šp)
        elsif /[§¨©ª«ƒ•ƒ–¯¬­®ƒŽ]/ =~ ch then
          replace = ['©','¯','«']
          serial = ('kata'==last_type) ? serial : 0;
        # ƒiƒ~Žš(”¼Šp)
        elsif /[±-Ý]/ =~ ch then
          replace = ['³','Ý','º']
          serial = ('kata'==last_type) ? max_cyclic(serial+1,replace.length-1) : 0;
        # ƒiƒ~Žš
        else
          replace = ['ƒE','ƒ“','ƒR']
          serial = ('kata'==last_type) ? max_cyclic(serial+1,replace.length-1) : 0;
        end
        ch = replace[serial]
        last_type = 'kata'
      # Š¿Žš
      elsif /[ˆê-êžX]/ =~ ch then
        ch = '•³'
        last_type = 'kanji'
      # ƒAƒ‹ƒtƒ@ƒxƒbƒg
      elsif /[a-z‚-‚šA-Z‚`-‚y]/ =~ ch then
        # ¬•¶Žš(”¼Šp)
        if /[a-z]/ =~ ch then
          replace = ['u','n','k','o']
        # ¬•¶Žš(‘SŠp)
        elsif /[‚-‚š]/ =~ ch then
          replace = ['‚•','‚Ž','‚‹','‚']
        # ‘å•¶Žš(”¼Šp)
        elsif /[A-z]/ =~ ch then
          replace = ['U','N','K','O']
        # ‘å•¶Žš(‘SŠp)
        else
          replace = ['‚t','‚m','‚j','‚n']
        end
        serial = ('alpha'==last_type) ? max_stop(serial+1,replace.length-1) : 0;
        ch = replace[serial]
        last_type = 'alpha'
      # Œp‘±
      elsif /[[\`E]/ =~ ch then
        # last_typeXV‚µ‚È‚¢
      # Œp‘±(”¼ŠpƒXƒy[ƒX‚É•ÏŠ·)
      elsif /[ßÞ]/ =~ ch then
        # last_typeXV‚µ‚È‚¢
        ch = " "
      # ‚»‚Ì‘¼
      else
        last_type = '-'
      end
      
      result = result + ch.to_s
    }
    
    return result
  end
end


