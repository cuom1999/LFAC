# Dãy số

**Tác giả đề:** Jakub Radoszewski  
**Tác giả lời giải:** Jakub Radoszewski  
**Giới hạn bộ nhớ:** 128 MB  
**Mã bài:** `cia`  
**Đề trực tuyến:** <https://oi.edu.pl/en/archive/amppz/2012/cia>


## Đề bài

Gọi dãy số nguyên \(a_1,a_2,\ldots,a_n\) là **\(k\)-chẵn** nếu tổng của mọi đoạn con liên tiếp gồm đúng \(k\) phần tử của dãy là số chẵn.

Với một dãy đã cho, hãy xác định cần thay đổi ít nhất bao nhiêu phần tử để dãy trở thành \(k\)-chẵn.

### Dữ liệu vào

Dòng đầu chứa hai số nguyên \(n\) và \(k\) (\(1\le k\le n\le1\,000\,000\)), lần lượt là độ dài dãy và tham số “chẵn”.

Dòng thứ hai chứa \(n\) số nguyên \(a_1,a_2,\ldots,a_n\), trong đó \(0\le a_i\le1\,000\,000\,000\).

### Dữ liệu ra

In một số nguyên duy nhất: số phần tử ít nhất cần thay đổi để dãy đã cho trở thành \(k\)-chẵn.

### Ví dụ

Với dữ liệu vào:

```text
8 3
1 2 3 4 5 6 7 8
```

kết quả đúng là:

```text
3
```

Còn với dữ liệu vào:

```text
8 3
2 4 2 4 2 4 2 4
```

kết quả đúng là:

```text
0
```

## Lời giải

Ta cần biến đổi dãy sao cho nó trở thành \(k\)-chẵn. Trước hết, giá trị chính xác của các phần tử không quan trọng; chỉ **tính chẵn lẻ** của chúng mới quan trọng. Vì vậy, có thể thay mỗi phần tử bằng phần dư khi chia cho \(2\), rồi chỉ xét các dãy nhị phân gồm \(0\) và \(1\).

Ta dễ biết những đoạn độ dài \(k\) nào hiện có tổng lẻ. Mỗi đoạn như vậy buộc ta phải đổi tính chẵn lẻ của ít nhất một phần tử, nhưng không rõ nên chọn phần tử nào. Cách tiếp cận này dẫn tới các thuật toán kinh nghiệm và khó bảo đảm đúng.

Ở bài này, tốt hơn là tập trung vào cấu trúc của dãy đích. Ký hiệu dãy kết quả cần tìm là \(a'_1,\ldots,a'_n\). Mọi đoạn liên tiếp độ dài \(k\) của dãy này phải có tổng chẵn. Xét hai đoạn liên tiếp

\[
a'_i,\ldots,a'_{i+k-1}
\qquad\text{và}\qquad
a'_{i+1},\ldots,a'_{i+k},
\]

có tổng lần lượt là \(S_1\) và \(S_2\). Chúng chỉ khác nhau ở phần tử bị bỏ đi và phần tử được thêm vào, nên

![Hai đoạn liên tiếp dài \(k\) trong dãy kết quả.](figures/2012-cia-fig-1.png)

\[
S_2=S_1+a'_{i+k}-a'_i.
\]

Vì \(S_1\) và \(S_2\) đều chẵn, \(a'_i\) và \(a'_{i+k}\) phải cùng tính chẵn lẻ. Mà chúng đều là bit, do đó

\[
a'_i=a'_{i+k}\qquad(1\le i\le n-k).
\]

Nói cách khác, dãy đích phải **tuần hoàn với chu kỳ \(k\)**.

### Biến dãy thành dãy tuần hoàn

Trước hết, xét bài toán: biến dãy nhị phân \(a_1,\ldots,a_n\) thành một dãy có chu kỳ \(k\), với ít lần thay đổi nhất.

Chia các vị trí thành \(k\) **chuỗi**: chuỗi thứ \(r\) gồm các vị trí

\[
r,\ r+k,\ r+2k,\ \ldots
\qquad(1\le r\le k).
\]

![Các chuỗi gồm những phần tử có chỉ số cách nhau đúng \(k\).](figures/2012-cia-fig-2.png)

Mỗi chuỗi phải trở thành hằng, vì các phần tử cách nhau \(k\) vị trí phải bằng nhau. Trong mỗi chuỗi, hãy đếm số số \(0\) và số số \(1\):

- nếu có nhiều \(0\) hơn, đổi toàn bộ các \(1\) thành \(0\);
- nếu có nhiều \(1\) hơn, đổi toàn bộ các \(0\) thành \(1\);
- nếu hai số lượng bằng nhau, chọn một trong hai giá trị bất kỳ.

Như vậy, với số thay đổi nhỏ nhất, ta thu được một dãy tuần hoàn chu kỳ \(k\).

Tuy nhiên, dãy đó chưa chắc đã là đáp án. Một dãy nhị phân \(k\)-chẵn bắt buộc phải có chu kỳ \(k\), nhưng điều ngược lại không đúng: tính tuần hoàn chỉ đảm bảo tất cả các đoạn độ dài \(k\) có **cùng tính chẵn lẻ**. Các tổng ấy có thể đều chẵn hoặc đều lẻ. Nếu chúng đều chẵn thì ta đã xong; nếu chúng đều lẻ thì cần xử lý thêm.

Khi đó, ta chỉ có thể đảo giá trị của toàn bộ một chuỗi. Đảo một chuỗi bất kỳ sẽ đổi tính chẵn lẻ của tổng trong đoạn đầu tiên gồm \(k\) phần tử, nên tất cả các đoạn độ dài \(k\) sẽ có tổng chẵn. Để số thay đổi tăng ít nhất, phải chọn chuỗi có số \(0\) và số \(1\) gần nhau nhất, tức là tối thiểu hóa trị tuyệt đối của hiệu giữa hai số lượng này.

Thật vậy, giả sử chuỗi được chọn có \(z\) số \(0\) và \(j\) số \(1\), với \(z\le j\); trường hợp \(z\ge j\) đối xứng. Ở lời giải tuần hoàn tham lam ban đầu, chuỗi này có \(z\) lần thay đổi (đổi các số \(0\) thành \(1\)). Sau khi đảo lựa chọn của chuỗi, số thay đổi sẽ là \(j\). Tổng số thay đổi tăng thêm \(j-z\), hay tổng quát là

\[
|j-z|.
\]

Do đó, khi cần đảo một chuỗi, ta chọn chuỗi có \(|j-z|\) nhỏ nhất.

### Ví dụ minh họa

Xét

\[
a=101000001010011000
\]

với \(k=4\). Viết dãy thành các hàng liên tiếp có bốn phần tử; mỗi cột khi đó là một chuỗi:

|  |  |  |  |
|---:|---:|---:|---:|
| 1 | 0 | 1 | 0 |
| 0 | 0 | 0 | 0 |
| 1 | 0 | 1 | 0 |
| 0 | 1 | 1 | 0 |
| 0 | 0 |  |  |

Đưa mọi chuỗi về hằng với số thay đổi ít nhất cho dãy tuần hoàn sau:

|  |  |  |  |
|---:|---:|---:|---:|
| 0 | 0 | 1 | 0 |
| 0 | 0 | 1 | 0 |
| 0 | 0 | 1 | 0 |
| 0 | 0 | 1 | 0 |
| 0 | 0 |  |  |

Trong dãy này, mọi đoạn độ dài \(4\) có tổng bằng \(1\), là số lẻ. Ta phải đảo một cột. Rẻ nhất là đảo cột đầu tiên; ta nhận được một dãy đích, trong đó các ô in đậm là năm vị trí khác với dãy ban đầu:

|  |  |  |  |
|---:|---:|---:|---:|
| 1 | 0 | 1 | 0 |
| **1** | 0 | 1 | 0 |
| 1 | 0 | 1 | 0 |
| **1** | **0** | 1 | 0 |
| **1** | 0 |  |  |

### Chứng minh tính đúng đắn

Ta đã chứng minh rằng mọi dãy \(k\)-chẵn nhị phân phải tuần hoàn với chu kỳ \(k\). Với mỗi chuỗi vị trí đồng dư modulo \(k\), bất kỳ dãy tuần hoàn nào cũng buộc toàn bộ chuỗi phải là \(0\) hoặc toàn bộ là \(1\). Vì vậy, chọn giá trị xuất hiện nhiều hơn trong từng chuỗi rõ ràng là cách duy nhất tối thiểu hóa độc lập số thay đổi trong chuỗi đó; tổng của các lựa chọn này tối thiểu hóa số thay đổi để tạo ra một dãy chu kỳ \(k\).

Nếu tổng của một chu kỳ là chẵn, mọi đoạn độ dài \(k\) đều chính là một hoán vị vòng của chu kỳ ấy, nên đều có tổng chẵn. Dãy thu được là hợp lệ và tối ưu.

Nếu tổng của một chu kỳ là lẻ, dãy chưa hợp lệ. Trong mọi dãy chu kỳ \(k\), để đổi tính chẵn lẻ của tổng một chu kỳ, phải đảo lựa chọn ở một số lẻ các chuỗi. Đảo hai chuỗi trở lên không thể rẻ hơn việc chỉ đảo chuỗi có chi phí tăng nhỏ nhất: chi phí đảo mỗi chuỗi là không âm \(|j-z|\). Vì thế chỉ cần đảo một chuỗi có \(|j-z|\) nhỏ nhất. Sau phép đảo, tổng mỗi đoạn dài \(k\) đổi từ lẻ sang chẵn, và số thay đổi tăng ít nhất có thể. Thuật toán do đó cho số thay đổi nhỏ nhất.

### Độ phức tạp

Duyệt dãy một lần để đếm số \(0\), số \(1\) trong từng chuỗi, rồi duyệt \(k\) chuỗi để cộng đáp án và tìm chi phí đảo nhỏ nhất. Tổng thời gian là \(O(n+k)=O(n)\), và bộ nhớ bổ sung là \(O(k)\).
