import matplotlib.pyplot as plt
import matplotlib.patches as patches

STAGE_COLORS = {
    'IF': '#a8d1ff',
    'ID': '#ffd1a8',
    'EX': '#a8ffa8',
    'MEM': '#ffa8a8',
    'WB': '#d1a8ff',
    'Stall': '#e0e0e0'
}

def draw_pipeline_diagram(title, instructions, cycle_data):
    fig, ax = plt.subplots(figsize=(15, len(instructions) * 0.8))
    total_cycles = max(len(row) for row in cycle_data)
    ax.set_xlim(0, total_cycles)
    ax.set_ylim(0, len(instructions))
    ax.set_xticks(range(total_cycles + 1))
    ax.set_yticks(range(len(instructions) + 1))
    ax.grid(True, linestyle='--', alpha=0.5)
    ax.set_xlabel('Cycles', fontsize=12, fontweight='bold')
    ax.set_ylabel('Instructions', fontsize=12, fontweight='bold')
    ax.set_title(title, fontsize=14, fontweight='bold', pad=20)
    ax.set_yticks([i + 0.5 for i in range(len(instructions))])
    ax.set_yticklabels(instructions[::-1], fontsize=10, fontfamily='monospace')
    for i, stages in enumerate(cycle_data):
        y_pos = len(instructions) - 1 - i
        for cycle, stage in enumerate(stages):
            if stage and stage in STAGE_COLORS:
                rect = patches.Rectangle(
                    (cycle, y_pos + 0.1),
                    1, 0.8,
                    linewidth=1,
                    edgecolor='black',
                    facecolor=STAGE_COLORS[stage]
                )
                ax.add_patch(rect)
                text_color = 'black'
                if stage == 'Stall':
                    text_label = 's'
                else:
                    text_label = stage
                ax.text(
                    cycle + 0.5, y_pos + 0.5,
                    text_label,
                    ha='center', va='center',
                    fontsize=9, fontweight='bold', color=text_color
                )

    plt.tight_layout()
    plt.show()

instructions = [
    "1. LW $t1, 0($t2)",
    "2. ADD $t1, $t1, $t4",
    "3. LW $t3, 0($t5)",
    "4. ADD $t1, $t1, $t3",
    "5. LW $t4, 0($t1)",
    "6. ADD $t5, $t5, $t4",
    "7. SW $t5, 0($t2)",
    "8. ADDI $t2, $t2, 4",
    "9. SUB $t9, $t8, $t2",
    "10. BNE $t9, $zero"
]

data_no_forwarding = [
    ['IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', 'IF', 'ID', 'Stall', 'Stall', 'EX', 'MEM', 'WB'],
    ['', '', 'IF', 'Stall', 'Stall', 'ID', 'EX', 'MEM', 'WB'],
    ['', '', '', 'Stall', 'Stall', 'IF', 'ID', 'Stall', 'Stall', 'EX', 'MEM', 'WB'],
    ['', '', '', '', '', '', 'IF', 'ID', 'Stall', 'Stall', 'EX', 'MEM', 'WB'],
    ['', '', '', '', '', '', '', 'IF', 'ID', 'Stall', 'Stall', 'EX', 'MEM', 'WB'],
    ['', '', '', '', '', '', '', '', 'IF', 'ID', 'Stall', 'Stall', 'EX', 'MEM', 'WB'],
    ['', '', '', '', '', '', '', '', '', 'IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', '', '', '', '', '', '', '', '', '', 'IF', 'ID', 'Stall', 'Stall', 'EX', 'MEM', 'WB'],
    ['', '', '', '', '', '', '', '', '', '', '', 'IF', 'ID', 'Stall', 'Stall', 'EX', 'MEM', 'WB']
]

draw_pipeline_diagram(
    "1) No Forwarding",
    instructions,
    data_no_forwarding
)

data_with_forwarding = [
    ['IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', 'IF', 'ID', 'Stall', 'EX', 'MEM', 'WB'],
    ['', '', 'IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', '', '', 'IF', 'ID', 'Stall', 'EX', 'MEM', 'WB'],
    ['', '', '', '', 'IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', '', '', '', '', 'IF', 'ID', 'Stall', 'EX', 'MEM', 'WB'],
    ['', '', '', '', '', '', 'IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', '', '', '', '', '', '', 'IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', '', '', '', '', '', '', '', 'IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', '', '', '', '', '', '', '', '', 'IF', 'ID', 'EX', 'MEM', 'WB']
]

draw_pipeline_diagram(
    "2) With Forwarding",
    instructions,
    data_with_forwarding
)

instructions_reordered = [
    "1. LW $t1", "3. LW $t3 (moved)", "2. ADD $t1", "4. ADD $t1",
    "5. LW $t4", "8. ADDI $t2 (moved)", "6. ADD $t5", "9. SUB $t9",
    "7. SW $t5", "10. BNE"
]

data_reordered = [
    ['IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', 'IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', '', 'IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', '', '', 'IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', '', '', '', 'IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', '', '', '', '', 'IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', '', '', '', '', '', 'IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', '', '', '', '', '', '', 'IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', '', '', '', '', '', '', '', 'IF', 'ID', 'EX', 'MEM', 'WB'],
    ['', '', '', '', '', '', '', '', '', 'IF', 'ID', 'EX', 'MEM', 'WB']
]

draw_pipeline_diagram(
    "3) Reordered Instructions",
    instructions_reordered,
    data_reordered
)
