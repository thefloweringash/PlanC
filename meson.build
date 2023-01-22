project('PlanC', 'cpp')

add_global_arguments(
  '-Wno-non-virtual-dtor',
  '-Wno-sign-compare',
  '-Wno-unused-result',
  language : 'cpp'
)

boost_dep = dependency('boost', modules : [
  'iostreams',
  'program_options',
  'filesystem',
  'system',
  'date_time',
  'thread',
  'regex',
  'serialization',
])

deps = [
  boost_dep,
  dependency('libcryptopp'),
  dependency('leveldb'),
  dependency('snappy'),
  dependency('zlib'),
]

comparator = static_library('leveldb-comparator', 'comparator.cpp', cpp_args : '-fno-rtti')

executable('planc', 
  'adb.cpp',
  'backup.cpp',
  'blocks.cpp',
  'common.cpp',
  'crypto.cpp',
  'planc.cpp',
  'properties.cpp',
  dependencies : deps,
  link_with : comparator,
  install : true
)
