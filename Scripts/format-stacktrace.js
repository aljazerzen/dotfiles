async function run() {
  const chunks = [];
  process.stdin.on('data', chunk => chunks.push(chunk));

  await new Promise(resolve => process.stdin.on('end', resolve));

  const stacktrace = Buffer.concat(chunks).toString();

  const formatted = stacktrace.replace(/\\t/g, '\t').replace(/\\"/g, '"')
    .split('\\n')
    .filter(line => !line.includes('\tat') || line.includes('com.calms.main'))
    .join('\n');

  process.stdout.write(formatted);
}

run().catch(console.error);