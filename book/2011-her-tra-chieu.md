# Trà chiều ★

**Tác giả đề:** Tomasz Idziaszek  
**Tác giả lời giải:** Jakub Łącki  
**Bộ nhớ:** 32 MB  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2011/her>


## Đề bài

Trong chuyến thăm quần đảo Bytic, Byteasar rất thích thức uống truyền thống ở đây: trà pha sữa. Thức uống luôn được pha theo nghi thức cố định. Đầu tiên, một tách được rót đầy hỗn hợp gồm một nửa trà và một nửa sữa. Sau đó chọn một từ nghi lễ dài \(n\), chỉ gồm hai ký tự `H` và `M`. Với \(i=1,2,\ldots,n\):

- nếu ký tự thứ \(i\) là `H`, Byteasar uống một nửa tách, rót thêm trà cho đầy tách rồi khuấy;
- nếu ký tự thứ \(i\) là `M`, làm tương tự nhưng rót thêm sữa.

Sau khi thực hiện xong mọi ký tự, phần chất lỏng còn lại bị đổ đi. Byteasar muốn biết tổng lượng mình đã uống: trà nhiều hơn, sữa nhiều hơn, hay hai loại bằng nhau.

### Dữ liệu vào

Dòng đầu chứa số nguyên \(n\) (\(1\le n\le100\,000\)). Dòng thứ hai chứa từ nghi lễ dài \(n\), gồm các ký tự `H` và `M`.

### Dữ liệu ra

In `H` nếu Byteasar đã uống nhiều trà hơn; `M` nếu đã uống nhiều sữa hơn; hoặc `HM` nếu hai lượng bằng nhau.

### Ví dụ

```text
Input
5
HMHHM

Output
H
```

Trong ví dụ, tổng lượng Byteasar đã uống là \(37/64\) tách trà và \(59/64\) tách sữa.

## Lời giải

### Nhìn vào phần còn lại

Thay vì cộng trực tiếp lượng Byteasar uống, hãy xét lượng **không** uống, tức lượng còn lại sau nghi thức. Tổng lượng đã rót của mỗi loại là biết được, nên từ lượng còn lại suy ra lượng đã uống.

Để tránh phân số, giả sử tách có dung tích \(2^{n+1}\) ml. Ban đầu tách có \(2^n\) ml trà và \(2^n\) ml sữa. Xét \(2^n\) ml trà được rót ở lượt đầu. Sau mỗi lượt tiếp theo, một nửa lượng này bị uống, nên sau \(n-1\) lần pha loãng còn lại 2 ml. Tương tự, phần được rót ở lượt thứ \(i\) đóng góp \(2^i\) ml vào lượng cuối cùng. Ngoài ra, luôn còn 1 ml trà và 1 ml sữa từ lần rót ban đầu.

Vì thế, chẳng hạn với từ `HMHHM`, cuối cùng tách chứa

\[
1+2^1+2^3+2^4
\]

ml trà và

\[
1+2^2+2^5
\]

ml sữa. Ta có thể cộng các lũy thừa của 2 bằng số nguyên lớn, rồi trừ để có đáp án chính xác. Nhưng bài toán chỉ hỏi dấu của hiệu, nên có lời giải đơn giản hơn nhiều.

### Quan sát quyết định

Lần rót cuối cùng không ảnh hưởng đến lượng đã uống, vì ngay sau đó Byteasar đổ phần còn lại đi. Do đó bỏ ký tự cuối của từ; từ nay chỉ xét \(n-1\) lượt rót, sau đó tách đầy một nửa.

Gọi \(t_p,m_p\) lần lượt là lượng trà, sữa đã rót vào tách, và \(t_c,m_c\) là lượng còn lại cuối nghi thức. Lượng đã uống là \(t_p-t_c\) và \(m_p-m_c\). Vì tách còn đầy một nửa,

\[
t_c+m_c=2^n.
\]

Nếu trong \(n-1\) ký tự được xét có nhiều `H` hơn `M`, lượng trà đã rót lớn hơn lượng sữa đã rót ít nhất nửa tách:

\[
t_p\ge m_p+2^n.
\]

Cuối cùng luôn còn ít nhất 1 ml sữa, nên \(t_c\le2^n-1\). Suy ra

\[
t_p-t_c\ge t_p-2^n+1\ge m_p+1.
\]

Tức là lượng trà đã uống còn lớn hơn cả **tổng** lượng sữa từng rót, nên chắc chắn lớn hơn lượng sữa đã uống. Lập luận đối xứng đúng khi `M` xuất hiện nhiều hơn.

Còn khi số `H` và `M` bằng nhau, tổng lượng hai loại đã rót bằng nhau. Khi đó loại nào còn ít hơn trong tách là loại đã được uống nhiều hơn. Nếu \(n=1\), Byteasar chỉ uống một nửa hỗn hợp ban đầu, nên đáp án là `HM`.

Với \(n>1\), một nửa lượng chất lỏng cuối cùng đến từ lần rót áp chót (lần cuối cùng không bị bỏ qua). Nếu lượt áp chót rót sữa, riêng phần này cộng với 1 ml sữa ban đầu đã bảo đảm lượng sữa còn lại lớn hơn lượng trà; do đó Byteasar đã uống nhiều trà hơn. Lý luận đối xứng cho trường hợp lượt áp chót rót trà.

### Thuật toán

1. Nếu \(n=1\), in `HM`.
2. Bỏ qua ký tự cuối; đếm số `H` và `M` trong \(n-1\) ký tự đầu.
3. Nếu một ký tự xuất hiện nhiều hơn, in chính ký tự đó.
4. Nếu hai số bằng nhau, in ký tự **khác** ký tự thứ \(n-1\) (ký tự của lượt áp chót).

Thuật toán dùng \(O(n)\) thời gian và \(O(1)\) bộ nhớ ngoài xâu đầu vào.
