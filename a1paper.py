def gen_layout(a_n, fake_quant_a_n, layout):
    if a_n == 1:
        return (fake_quant_a_n, layout)
    fake_quant_a_nm1 = papers[a_n] // 2
    fake_quant_a_nm1 += fake_quant_a_n // 2
    layout = [fake_quant_a_nm1 * 2].extend(layout)
    return gen_layout(a_n - 1, fake_quant_a_nm1, layout)

n = int(input())
papers = [0, 0]
for paper_quantity in map(int, input().split()):
    papers.append(paper_quantity)

#total_area = sum(map(lambda p: p[1] * (0.5 / 2**(p[0] - 1)), enumerate(papers)))
#print(total_area)
#if total_area < 0.5:
#    print("impossible")
#    sys.exit(0)

(a1s, layout) = gen_layout(n, papers[-1], [])
if a1s == 0:
    print("impossible")
else:
    print(a1s, "layout:", layout)
