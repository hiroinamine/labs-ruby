require 'jose'
require 'zlib'
require 'stringio'
require "base64"


def compress(plain_text)
  # Java version: bytes = this.payload != null ? payload.getBytes(Strings.UTF_8) : toJson(claims);
  #               base64UrlEncodedBody = TextCodec.BASE64URL.encode(compressionCodec.compress(bytes));
  zstream = Zlib::Deflate.new(nil, -Zlib::MAX_WBITS)
  buf = zstream.deflate(plain_text, Zlib::FINISH)
  zstream.finish
  zstream.close
  p buf
  encoded = Base64.encode64(buf)
  return encoded
end

def base64_url_decode(str)
  # add '=' padding
  str = case str.length % 4
    when 2 then str + '=='
    when 3 then str + '='
    else
      str
  end

  # Base64.decode64(str.tr('-_', '+/'))
  Base64.strict_decode64(str.tr('-_', '+/'))
end

def uncompress(input)
  # Java version: byte[] decompressed = compressionCodec.decompress(TextCodec.BASE64URL.decode(base64UrlEncodedPayload));
  #               payload = new String(decompressed, Strings.UTF_8);

  # decoded = base64_url_decode(input)
  decoded = Base64.decode64(input)
  # decoded = Base64.urlsafe_decode64(input)
  # decoded = base64_url_decode(input)
  p decoded

  zstream = Zlib::Inflate.new(-Zlib::MAX_WBITS)
  result = zstream.inflate(decoded)
  zstream.finish
  zstream.close


  # zstream = Zlib::Inflate.new(-Zlib::MAX_WBITS)
  # buf = zstream.inflate(decoded)
  # zstream.finish
  # zstream.close
  # return buf
  # return Zlib::Inflate.new(-Zlib::MAX_WBITS).inflate(Base64.decode64(cipher_text))
  return result
end


# token = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiIsInppcCI6IkRFRiJ9.eNqUWdtu3DYQ_ZVAz0bQJmkc-6kURe8ylkSVl90oRUBskm2xgG_w2m2DIP_eISntitRIdl7sZOYMNRzO5ZD-nu0fP2fn2b-7q6vd5ubl7mZzvbvZ2n9-Pzvb3N29_HJ7nZ1knx_3INzvs_Pv2dX2782Xb2a_vedfs_Oz16enr9-dZIC729zstgD585dPJ9nd_e1fu6strEy-woK7_cP95uH2HtaCDzjxmpclJ_WLSki-5FK84DWpeM0AsdvHNucP94_bk2x7vdldPenql8f9w-01vdrsrp0v2ZrllJSlbZisuFJc1ACSomS2EUpbyRohtdXkA38vcmUVXbLClKwHLdgYU4h1XQpSzGEI1XzFVPbpB7h0cMbDC1YyzSwlNWWlLbiiwtR6uFgvs3lrqagaUreWF5HfVDICi6TWQ52Q1jQFijJ6SkUKOASutCRayF7YLQi_Cq4ToWR_GOY-KkxzjG2_xyWRC5YTepkqul11v3lhGyneM6ptZUrNA2rCBsAUtklZrZlU0yBWNaVoGRtDeuNBUHud3yIlshj8c4TqV7ZzGithG3HIOlC_1ZG15hWkUclpCyffEKUO681Bj_98LmoYAkpHVn3JuB8AhhRxldODDltc848QnAmxbZaiZrY2VT44JJfcRLU1hRqxl6wdyse54qXhPBHRIHdyU14KKHCiB-WNQ4-niuEuoAnVlJOSivqCLzAIL3ApVLwvJDWhnltxeB6mSVvLADfrn4QOBBXZ-eHhQi6Edom0FumG-w_iUss-uH42oUxicKyZ7tuxHutwfbZgMuTbSMElYpuzml3wOPxDPdIyUgi0dTwu81UdIRpWF7xe4DpfEv7njH7FJL9oUQD-7ZAUzCpTVUS2YxXkS38ytiFtBfuzFdNLUcxjFZMrTl2Lp4w3cWiP6HEqche_GlRGJdEuxYLXiUCYaDeQqImRl0DTZCvO1j4Gs57FcCQoAQADWwrKFGL79OrIql1TR0RIPo8nQOAQF6YuFCLqTg1R2RzG8KVjJIjOpSuyh04bKMuYxKiRW57auP6sMTlaMiMlNOkCFM_BIAEbQ5-PsSsCY4xojNNhfShRTX8pQcx9pzuGGcY4RyYnPUgQqAfHbE4XOVICXNqRkAklRjtmIBN50nENRNTRD1xTQ2tBNWO6cFQN5ldfgQpDYkmR6vxIgUgvhGyfxI1HD1SzsUD_Q8tXjEi6jHXxRoLMt34fUM7ipUZc10sPTRqXAtl_b5R2nSUCpLHxwq43RDKjyIKh_kSdXzSOlymYPXoZX1SWpF6wfibFI6kHJJwwiOPgDGVTrNBfCD4wao7FEZnNkbAUeDjbnGi6DBepJ7EzS0pWCz2Y-Z0yLZf-bpfwVy9OUzYS-kj4C2nqaERsmALusmbALSvGKsLLaeiIh8QQdEM4GQ0qSQyQR6AM7cfYwYgweEkYwCGatr6I4clI72XDwdzd-v1Yxa_PqdJStUoA4cpLGm61uGSxg-OumoiTtuq1SRt0F3Qk980xZ1hN8pKBySHoq1fIE4eJryhFARaDdqTFYAU1YRUTvEQZrozxqlNQrpzPE9qwoQnlxL0noJBryUjhtj692YK5xoHG26uw95O4CXSjgMfrIteWRHzwayJ8T1SdeT7Fj7HjOCas2FaQonzF5iCQbzz-wJjXOqliOr2djtqAeZJbzECwZmlSItE9uPWAnipZtWRs8HxluD0SiXCeIFpCT7QFUctchNYLMn-_CHZ9SxjfFApBjafu1sgnvz0c_9iGZoppME8WEtbrFabOS0Ev_UDGHgnTUWrmnlyilQfQSB4_xMXOhDfH46iOktBPgpkMDblvaXwABQyq1pa8SoZR-BZ6Wy7yFlp3x515egkugo1ac73MSemSJt2aTyRkAIaYjmu03zfqjHvk9ZME_LHuXWzsUWeprPPJzjllJ73CNOWicWNX1G3FPwaalCTyFMyfjqwOMNcDn4HzV_4RKtnJNAA3R30elErflBIGFtdT9CrjVygAz11ft7xeCXeDCiPK-iwsjOsH-pkm_lG7KcODrPqJzzTwHzD9KRv__JLGY96kuyPOW0w-g3T5HXM6Xrv-BRMEedE86FScQEeb7hkN6BXUBhzgipQTqwc1w9ef-zakm05J7vTLFa4p-aSRyy9c06V5ovx0kj18u3N_Geta9W7zkJ3_-vbVmze_nf56-tb9WWwP2rOzF_mrHPTb_-56_buz07c__gcAAP__.gvMm8pKia-eRFrZXFjuCt7dxpKlicJg7kLUhLEBkJd0X2IQ_sTXJDIUV_S1iG0xk_ZNPlTPQrazYg1gAvrctrw'


# token = 'eyJhbGciOiJIUzUxMiIsInppcCI6IkRFRiJ9.eNqqViouTVKyUkoyStJLLMh0sLRMLCjQS87PVdJRSs5JzMwtVrKKjtVRKqksSAUqCw12DQLKZCaWKFkZmhmaGlsaGZhbAgWKgeqULC0VnIycgPKpFQVKVsZgeWMLc8taAAAAAP__.SSBAfGL43UkcJI0QPPxnaftGI8zyWnr4kDYwIJR--XJF4grM2jaZxyhvxfo97i78WB9lRR1_PKCmLvjv3ujJEQ'

token = 'eyJhbGciOiJIUzUxMiIsInppcCI6IkRFRiJ9.eNrKz0kEAAAA__8.FSRVIBEZ_CO_3PjNdpDsPzGn9_RJi2_Mv7cmwoJ4VH7z3HV3gU1QBBpZy_kEtVGQd_AdYprff08wYPOU4-i7WA'
# puts token

result = token.split('.')
enc_body = result[1]

plain_text = 'ola'
compressed = compress(plain_text)
puts compressed
# decompressed = uncompress(compressed)
decompressed = uncompress(enc_body)
puts decompressed



